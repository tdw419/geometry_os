; DESCRIPTION: Composite: . Then Draws a black circle centered at (79, 64) with radius 10. Then Places a cyan dot at position (12, 128).
; PLAN: r0=79(x), r1=64(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=12(x), r1=128(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a black circle centered at (79, 64) with radius 10.
; PLAN: r0=79(x), r1=64(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 64
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan dot at position (12, 128).
; PLAN: r0=12(x), r1=128(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 12
LDI r1, 128
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
