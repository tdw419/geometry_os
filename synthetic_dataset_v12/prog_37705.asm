; DESCRIPTION: Sets a single cyan pixel at (470, 162).
; PLAN: r0=470(x), r1=162(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 470
LDI r1, 162
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
