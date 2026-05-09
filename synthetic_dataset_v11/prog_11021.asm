; DESCRIPTION: Composite: . Then Places a red dot at position (24, 135). Then Places a blue circle of radius 12 at center (154, 118).
; PLAN: r0=24(x), r1=135(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=154(x), r1=118(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red dot at position (24, 135).
; PLAN: r0=24(x), r1=135(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 135
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a blue circle of radius 12 at center (154, 118).
; PLAN: r0=154(x), r1=118(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 118
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
