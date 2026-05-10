; DESCRIPTION: Places a blue dot at position (231, 161).
; PLAN: r0=231(x), r1=161(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 231
LDI r1, 161
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
