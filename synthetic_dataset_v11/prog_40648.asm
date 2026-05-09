; DESCRIPTION: Composite: . Then Places a green dot at position (136, 181). Then Renders a red disk with center (184, 168) and radius 44.
; PLAN: r0=136(x), r1=181(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=184(x), r1=168(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green dot at position (136, 181).
; PLAN: r0=136(x), r1=181(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 136
LDI r1, 181
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a red disk with center (184, 168) and radius 44.
; PLAN: r0=184(x), r1=168(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 168
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
