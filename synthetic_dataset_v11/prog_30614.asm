; DESCRIPTION: Composite: . Then Renders a cyan disk with center (137, 98) and radius 44. Then Places a magenta dot at position (64, 31).
; PLAN: r0=137(x), r1=98(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=64(x), r1=31(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan disk with center (137, 98) and radius 44.
; PLAN: r0=137(x), r1=98(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 98
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (64, 31).
; PLAN: r0=64(x), r1=31(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 64
LDI r1, 31
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
