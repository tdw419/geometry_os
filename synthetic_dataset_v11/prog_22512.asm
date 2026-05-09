; DESCRIPTION: Composite: . Then Renders a purple disk with center (81, 49) and radius 46. Then Places a green dot at position (156, 42).
; PLAN: r0=81(x), r1=49(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=156(x), r1=42(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple disk with center (81, 49) and radius 46.
; PLAN: r0=81(x), r1=49(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 49
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green dot at position (156, 42).
; PLAN: r0=156(x), r1=42(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 156
LDI r1, 42
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
