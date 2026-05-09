; DESCRIPTION: Places a yellow dot at position (243, 130).
; PLAN: r0=243(x), r1=130(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 243
LDI r1, 130
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
