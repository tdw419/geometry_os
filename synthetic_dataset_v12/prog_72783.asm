; DESCRIPTION: Composite: Creates a purple rectangular region at (268, 79) spanning 33 by 93 pixels then Draws a orange line from (117, 74) to (185, 209).
; PLAN: r0=268(x), r1=79(y), r2=33(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x1), r6=74(y1), r7=185(x2), r8=209(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 268
LDI r1, 79
LDI r2, 33
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 74
LDI r7, 185
LDI r8, 209
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
