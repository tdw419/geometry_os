; DESCRIPTION: Places a cyan dot at position (68, 160).
; PLAN: r0=68(x), r1=160(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 68
LDI r1, 160
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
