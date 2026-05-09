; DESCRIPTION: Places a yellow dot at position (12, 154).
; PLAN: r0=12(x), r1=154(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 12
LDI r1, 154
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
