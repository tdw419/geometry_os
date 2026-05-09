; DESCRIPTION: Composite: Renders a blue disk with center (430, 103) and radius 76 then Places a orange dot at position (71, 124) then Creates a cyan rectangular region at (354, 13) spanning 47 by 99 pixels.
; PLAN: r0=430(x), r1=103(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=71(x), r6=124(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=354(x), r11=13(y), r12=47(width), r13=99(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 430
LDI r1, 103
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 71
LDI r6, 124
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 354
LDI r11, 13
LDI r12, 47
LDI r13, 99
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
