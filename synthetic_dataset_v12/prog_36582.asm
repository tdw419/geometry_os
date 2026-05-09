; DESCRIPTION: Sets a single cyan pixel at (434, 116).
; PLAN: r0=434(x), r1=116(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 434
LDI r1, 116
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
