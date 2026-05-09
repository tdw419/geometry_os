; DESCRIPTION: Composite: Places a cyan dot at position (73, 230) then Renders a white disk with center (437, 166) and radius 23 then Creates a green rectangular region at (381, 63) spanning 25 by 59 pixels.
; PLAN: r0=73(x), r1=230(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=437(x), r6=166(y), r7=23(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=381(x), r11=63(y), r12=25(width), r13=59(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 73
LDI r1, 230
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 437
LDI r6, 166
LDI r7, 23
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 381
LDI r11, 63
LDI r12, 25
LDI r13, 59
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
