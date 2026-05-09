; DESCRIPTION: Places a yellow dot at position (73, 154).
; PLAN: r0=73(x), r1=154(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 73
LDI r1, 154
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
