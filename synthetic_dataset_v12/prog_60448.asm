; DESCRIPTION: Places a green dot at position (114, 154).
; PLAN: r0=114(x), r1=154(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 114
LDI r1, 154
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
