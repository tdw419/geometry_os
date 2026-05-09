; DESCRIPTION: Places a cyan dot at position (152, 35).
; PLAN: r0=152(x), r1=35(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 152
LDI r1, 35
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
