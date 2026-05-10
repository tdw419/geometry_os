; DESCRIPTION: Sets a single cyan pixel at (70, 152).
; PLAN: r0=70(x), r1=152(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 70
LDI r1, 152
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
