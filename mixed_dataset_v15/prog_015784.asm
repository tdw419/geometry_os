; DESCRIPTION: Places a cyan dot at position (366, 152).
; PLAN: r0=366(x), r1=152(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 366
LDI r1, 152
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
