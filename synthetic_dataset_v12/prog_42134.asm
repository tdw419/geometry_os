; DESCRIPTION: Places a cyan dot at position (137, 169).
; PLAN: r0=137(x), r1=169(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 137
LDI r1, 169
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
