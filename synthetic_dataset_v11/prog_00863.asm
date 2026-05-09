; DESCRIPTION: Composite: . Then Creates a purple rectangular region at (38, 122) spanning 74 by 118 pixels. Then Places a blue line segment connecting (173, 195) to (145, 167).
; PLAN: r0=38(x), r1=122(y), r2=74(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=173(x1), r1=195(y1), r2=145(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple rectangular region at (38, 122) spanning 74 by 118 pixels.
; PLAN: r0=38(x), r1=122(y), r2=74(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 122
LDI r2, 74
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue line segment connecting (173, 195) to (145, 167).
; PLAN: r0=173(x1), r1=195(y1), r2=145(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 195
LDI r2, 145
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
