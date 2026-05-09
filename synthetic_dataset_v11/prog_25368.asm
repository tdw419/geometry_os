; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (186, 209) with radius 41. Then Places a white line segment connecting (114, 155) to (80, 178).
; PLAN: r0=186(x), r1=209(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=114(x1), r1=155(y1), r2=80(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a magenta circular shape at (186, 209) with radius 41.
; PLAN: r0=186(x), r1=209(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 209
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white line segment connecting (114, 155) to (80, 178).
; PLAN: r0=114(x1), r1=155(y1), r2=80(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 155
LDI r2, 80
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
