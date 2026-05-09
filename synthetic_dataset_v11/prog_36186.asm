; DESCRIPTION: Places a yellow dot at position (87, 236).
; PLAN: r0=87(x), r1=236(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 87
LDI r1, 236
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
