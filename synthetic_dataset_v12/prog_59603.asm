; DESCRIPTION: Places a blue dot at position (368, 154).
; PLAN: r0=368(x), r1=154(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 368
LDI r1, 154
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
