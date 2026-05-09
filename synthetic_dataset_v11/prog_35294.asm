; DESCRIPTION: Composite: . Then Places a blue line segment connecting (107, 42) to (133, 228). Then Creates a black circular shape at (140, 136) with radius 71.
; PLAN: r0=107(x1), r1=42(y1), r2=133(x2), r3=228(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=140(x), r1=136(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue line segment connecting (107, 42) to (133, 228).
; PLAN: r0=107(x1), r1=42(y1), r2=133(x2), r3=228(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 42
LDI r2, 133
LDI r3, 228
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (140, 136) with radius 71.
; PLAN: r0=140(x), r1=136(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 136
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
