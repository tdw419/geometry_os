; DESCRIPTION: Composite: . Then Sets a single orange pixel at (101, 223). Then Places a blue circle of radius 10 at center (68, 126).
; PLAN: r0=101(x), r1=223(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=68(x), r1=126(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single orange pixel at (101, 223).
; PLAN: r0=101(x), r1=223(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 101
LDI r1, 223
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a blue circle of radius 10 at center (68, 126).
; PLAN: r0=68(x), r1=126(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 126
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
