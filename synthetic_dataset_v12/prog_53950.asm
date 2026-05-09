; DESCRIPTION: Renders a cyan disk with center (276, 97) and radius 73.
; PLAN: r0=276(x), r1=97(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 97
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
