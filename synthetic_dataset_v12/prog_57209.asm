; DESCRIPTION: Places a yellow dot at position (249, 221).
; PLAN: r0=249(x), r1=221(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 249
LDI r1, 221
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
