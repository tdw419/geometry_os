; DESCRIPTION: Composite: Creates a orange rectangular region at (335, 136) spanning 48 by 110 pixels then Places a orange circle of radius 51 at center (226, 59) then Places a green dot at position (34, 46).
; PLAN: r0=335(x), r1=136(y), r2=48(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=226(x), r6=59(y), r7=51(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=34(x), r11=46(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 335
LDI r1, 136
LDI r2, 48
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 59
LDI r7, 51
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 34
LDI r11, 46
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
