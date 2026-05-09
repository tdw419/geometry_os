; DESCRIPTION: Composite: . Then Creates a red rectangular region at (95, 154) spanning 112 by 29 pixels. Then Places a purple line segment connecting (30, 132) to (249, 85).
; PLAN: r0=95(x), r1=154(y), r2=112(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=30(x1), r1=132(y1), r2=249(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red rectangular region at (95, 154) spanning 112 by 29 pixels.
; PLAN: r0=95(x), r1=154(y), r2=112(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 154
LDI r2, 112
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple line segment connecting (30, 132) to (249, 85).
; PLAN: r0=30(x1), r1=132(y1), r2=249(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 132
LDI r2, 249
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
