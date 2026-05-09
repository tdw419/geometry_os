; DESCRIPTION: Composite: . Then Renders a green line between points (167, 150) and (184, 83). Then Places a black circle of radius 23 at center (73, 58).
; PLAN: r0=167(x1), r1=150(y1), r2=184(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=73(x), r1=58(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a green line between points (167, 150) and (184, 83).
; PLAN: r0=167(x1), r1=150(y1), r2=184(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 150
LDI r2, 184
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black circle of radius 23 at center (73, 58).
; PLAN: r0=73(x), r1=58(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 58
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
