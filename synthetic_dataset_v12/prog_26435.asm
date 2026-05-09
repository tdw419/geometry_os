; DESCRIPTION: Sets a single cyan pixel at (32, 48).
; PLAN: r0=32(x), r1=48(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 32
LDI r1, 48
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
