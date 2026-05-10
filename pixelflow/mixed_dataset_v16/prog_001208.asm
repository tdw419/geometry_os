; DESCRIPTION: Composite: Creates a orange rectangular region at (277, 199) spanning 106 by 35 pixels then Renders a orange line between points (256, 105) and (215, 219).
; PLAN: r0=277(x), r1=199(y), r2=106(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=256(x1), r6=105(y1), r7=215(x2), r8=219(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 277
LDI r1, 199
LDI r2, 106
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 105
LDI r7, 215
LDI r8, 219
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
