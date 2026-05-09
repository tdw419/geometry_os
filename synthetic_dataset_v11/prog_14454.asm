; DESCRIPTION: Composite: . Then Places a green dot at position (215, 79). Then Creates a cyan circular shape at (90, 86) with radius 77.
; PLAN: r0=215(x), r1=79(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=90(x), r1=86(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green dot at position (215, 79).
; PLAN: r0=215(x), r1=79(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 215
LDI r1, 79
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Creates a cyan circular shape at (90, 86) with radius 77.
; PLAN: r0=90(x), r1=86(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 86
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
