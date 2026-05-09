; DESCRIPTION: Composite: . Then Places a yellow 71x73 rectangle at position (140, 85). Then Renders a black disk with center (159, 137) and radius 68.
; PLAN: r0=140(x), r1=85(y), r2=71(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=159(x), r1=137(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow 71x73 rectangle at position (140, 85).
; PLAN: r0=140(x), r1=85(y), r2=71(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 85
LDI r2, 71
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black disk with center (159, 137) and radius 68.
; PLAN: r0=159(x), r1=137(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 137
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
