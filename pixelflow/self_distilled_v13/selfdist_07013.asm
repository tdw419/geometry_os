; DESCRIPTION: Places a white dot at position (398, 86).
; PLAN: r0=398(x), r1=86(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 398
LDI r1, 86
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
