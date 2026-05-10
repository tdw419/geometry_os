; DESCRIPTION: Places a white dot at position (295, 49).
; PLAN: r0=295(x), r1=49(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 295
LDI r1, 49
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
