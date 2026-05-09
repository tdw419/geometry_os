; DESCRIPTION: Composite: . Then Places a orange circle of radius 23 at center (128, 144). Then Places a red dot at position (8, 210).
; PLAN: r0=128(x), r1=144(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=8(x), r1=210(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange circle of radius 23 at center (128, 144).
; PLAN: r0=128(x), r1=144(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 144
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red dot at position (8, 210).
; PLAN: r0=8(x), r1=210(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 8
LDI r1, 210
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
