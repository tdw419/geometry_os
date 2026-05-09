; DESCRIPTION: Sets a single green pixel at (18, 154).
; PLAN: r0=18(x), r1=154(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 18
LDI r1, 154
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
