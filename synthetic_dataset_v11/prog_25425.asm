; DESCRIPTION: Composite: . Then Places a yellow dot at position (224, 157). Then Places a yellow circle of radius 11 at center (130, 50).
; PLAN: r0=224(x), r1=157(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=130(x), r1=50(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow dot at position (224, 157).
; PLAN: r0=224(x), r1=157(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 224
LDI r1, 157
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Places a yellow circle of radius 11 at center (130, 50).
; PLAN: r0=130(x), r1=50(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 50
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
