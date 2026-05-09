; DESCRIPTION: Composite: . Then Creates a red rectangular region at (80, 116) spanning 112 by 94 pixels. Then Places a blue line segment connecting (8, 181) to (229, 74).
; PLAN: r0=80(x), r1=116(y), r2=112(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=8(x1), r1=181(y1), r2=229(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red rectangular region at (80, 116) spanning 112 by 94 pixels.
; PLAN: r0=80(x), r1=116(y), r2=112(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 116
LDI r2, 112
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue line segment connecting (8, 181) to (229, 74).
; PLAN: r0=8(x1), r1=181(y1), r2=229(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 181
LDI r2, 229
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
