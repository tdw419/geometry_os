; DESCRIPTION: Composite: Sets a single orange pixel at (163, 103) then Renders a cyan disk with center (385, 117) and radius 10 then Creates a blue rectangular region at (373, 197) spanning 55 by 45 pixels.
; PLAN: r0=163(x), r1=103(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=385(x), r6=117(y), r7=10(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=373(x), r11=197(y), r12=55(width), r13=45(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 163
LDI r1, 103
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 385
LDI r6, 117
LDI r7, 10
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 373
LDI r11, 197
LDI r12, 55
LDI r13, 45
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
