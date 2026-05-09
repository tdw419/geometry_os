; DESCRIPTION: Composite: . Then Renders a red disk with center (132, 119) and radius 61. Then Places a green dot at position (117, 184).
; PLAN: r0=132(x), r1=119(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=117(x), r1=184(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red disk with center (132, 119) and radius 61.
; PLAN: r0=132(x), r1=119(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 119
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green dot at position (117, 184).
; PLAN: r0=117(x), r1=184(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 117
LDI r1, 184
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
