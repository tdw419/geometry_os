; DESCRIPTION: Places a purple dot at position (465, 236).
; PLAN: r0=465(x), r1=236(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 465
LDI r1, 236
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
