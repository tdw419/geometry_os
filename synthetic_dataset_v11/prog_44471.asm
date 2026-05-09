; DESCRIPTION: Places a cyan dot at position (123, 200).
; PLAN: r0=123(x), r1=200(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 123
LDI r1, 200
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
