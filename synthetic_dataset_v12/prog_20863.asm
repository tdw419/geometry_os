; DESCRIPTION: Sets a single cyan pixel at (487, 95).
; PLAN: r0=487(x), r1=95(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 487
LDI r1, 95
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
