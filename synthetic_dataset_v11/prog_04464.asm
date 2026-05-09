; DESCRIPTION: Composite: . Then Renders a magenta disk with center (179, 162) and radius 68. Then Places a orange dot at position (147, 100).
; PLAN: r0=179(x), r1=162(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=147(x), r1=100(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta disk with center (179, 162) and radius 68.
; PLAN: r0=179(x), r1=162(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 162
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange dot at position (147, 100).
; PLAN: r0=147(x), r1=100(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 147
LDI r1, 100
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
