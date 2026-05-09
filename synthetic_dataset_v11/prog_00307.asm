; DESCRIPTION: Composite: . Then Places a purple line segment connecting (137, 106) to (29, 248). Then Places a white 55x66 rectangle at position (62, 64).
; PLAN: r0=137(x1), r1=106(y1), r2=29(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=62(x), r1=64(y), r2=55(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple line segment connecting (137, 106) to (29, 248).
; PLAN: r0=137(x1), r1=106(y1), r2=29(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 106
LDI r2, 29
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white 55x66 rectangle at position (62, 64).
; PLAN: r0=62(x), r1=64(y), r2=55(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 64
LDI r2, 55
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
