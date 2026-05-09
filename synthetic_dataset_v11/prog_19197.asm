; DESCRIPTION: Composite: . Then Places a white dot at position (145, 152). Then Renders a red disk with center (74, 94) and radius 53.
; PLAN: r0=145(x), r1=152(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=74(x), r1=94(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white dot at position (145, 152).
; PLAN: r0=145(x), r1=152(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 145
LDI r1, 152
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a red disk with center (74, 94) and radius 53.
; PLAN: r0=74(x), r1=94(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 94
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
