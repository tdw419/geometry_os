; DESCRIPTION: Composite: . Then Places a red dot at position (56, 68). Then Renders a yellow disk with center (180, 233) and radius 20.
; PLAN: r0=56(x), r1=68(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=180(x), r1=233(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red dot at position (56, 68).
; PLAN: r0=56(x), r1=68(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 56
LDI r1, 68
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow disk with center (180, 233) and radius 20.
; PLAN: r0=180(x), r1=233(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 233
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
