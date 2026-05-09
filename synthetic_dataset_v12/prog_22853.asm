; DESCRIPTION: Places a blue dot at position (312, 231).
; PLAN: r0=312(x), r1=231(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 312
LDI r1, 231
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
