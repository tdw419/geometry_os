; DESCRIPTION: Composite: . Then Creates a purple rectangular region at (106, 158) spanning 83 by 73 pixels. Then Places a magenta line segment connecting (52, 38) to (237, 179).
; PLAN: r0=106(x), r1=158(y), r2=83(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=52(x1), r1=38(y1), r2=237(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple rectangular region at (106, 158) spanning 83 by 73 pixels.
; PLAN: r0=106(x), r1=158(y), r2=83(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 158
LDI r2, 83
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta line segment connecting (52, 38) to (237, 179).
; PLAN: r0=52(x1), r1=38(y1), r2=237(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 38
LDI r2, 237
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
