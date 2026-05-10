; DESCRIPTION: Places a yellow dot at position (70, 83).
; PLAN: r0=70(x), r1=83(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 70
LDI r1, 83
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
