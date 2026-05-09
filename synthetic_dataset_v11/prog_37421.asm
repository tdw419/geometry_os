; DESCRIPTION: Composite: . Then Places a purple line segment connecting (95, 106) to (60, 55). Then Creates a magenta circular shape at (167, 122) with radius 52.
; PLAN: r0=95(x1), r1=106(y1), r2=60(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=167(x), r1=122(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple line segment connecting (95, 106) to (60, 55).
; PLAN: r0=95(x1), r1=106(y1), r2=60(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 106
LDI r2, 60
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a magenta circular shape at (167, 122) with radius 52.
; PLAN: r0=167(x), r1=122(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 122
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
