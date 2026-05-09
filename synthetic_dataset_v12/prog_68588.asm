; DESCRIPTION: Sets a single cyan pixel at (474, 126).
; PLAN: r0=474(x), r1=126(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 474
LDI r1, 126
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
