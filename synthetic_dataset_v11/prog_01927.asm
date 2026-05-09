; DESCRIPTION: Composite: . Then Renders a red disk with center (186, 133) and radius 66. Then Places a magenta dot at position (87, 225).
; PLAN: r0=186(x), r1=133(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=87(x), r1=225(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red disk with center (186, 133) and radius 66.
; PLAN: r0=186(x), r1=133(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 133
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (87, 225).
; PLAN: r0=87(x), r1=225(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 87
LDI r1, 225
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
