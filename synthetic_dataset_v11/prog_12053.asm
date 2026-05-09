; DESCRIPTION: Composite: . Then Places a magenta 115x52 rectangle at position (114, 124). Then Places a red line segment connecting (176, 159) to (180, 23).
; PLAN: r0=114(x), r1=124(y), r2=115(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=176(x1), r1=159(y1), r2=180(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta 115x52 rectangle at position (114, 124).
; PLAN: r0=114(x), r1=124(y), r2=115(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 124
LDI r2, 115
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red line segment connecting (176, 159) to (180, 23).
; PLAN: r0=176(x1), r1=159(y1), r2=180(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 159
LDI r2, 180
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
