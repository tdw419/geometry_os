; DESCRIPTION: Places a cyan disk with center (246, 75) and radius 30.
; PLAN: r0=246(x), r1=75(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 75
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
