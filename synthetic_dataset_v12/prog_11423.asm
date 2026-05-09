; DESCRIPTION: Sets a single cyan pixel at (372, 136).
; PLAN: r0=372(x), r1=136(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 372
LDI r1, 136
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
