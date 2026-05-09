; DESCRIPTION: Places a purple dot at position (54, 154).
; PLAN: r0=54(x), r1=154(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 54
LDI r1, 154
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
