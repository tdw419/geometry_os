; DESCRIPTION: Places a yellow dot at position (465, 147).
; PLAN: r0=465(x), r1=147(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 465
LDI r1, 147
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
