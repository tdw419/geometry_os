; DESCRIPTION: Sets a single cyan pixel at (446, 220).
; PLAN: r0=446(x), r1=220(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 446
LDI r1, 220
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
