; DESCRIPTION: Composite: Creates a magenta rectangular region at (340, 63) spanning 119 by 106 pixels then Places a purple line segment connecting (409, 214) to (68, 35).
; PLAN: r0=340(x), r1=63(y), r2=119(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=409(x1), r6=214(y1), r7=68(x2), r8=35(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 340
LDI r1, 63
LDI r2, 119
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 214
LDI r7, 68
LDI r8, 35
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
