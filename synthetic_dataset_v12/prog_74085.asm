; DESCRIPTION: Composite: Renders a green line between points (265, 210) and (172, 101) then Sets a single orange pixel at (365, 174) then Creates a purple rectangular region at (129, 69) spanning 39 by 28 pixels.
; PLAN: r0=265(x1), r1=210(y1), r2=172(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=365(x), r6=174(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=129(x), r11=69(y), r12=39(width), r13=28(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 265
LDI r1, 210
LDI r2, 172
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 174
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 129
LDI r11, 69
LDI r12, 39
LDI r13, 28
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
