; DESCRIPTION: Sets a single black pixel at (480, 154).
; PLAN: r0=480(x), r1=154(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 480
LDI r1, 154
LDI r2, 0x000000
PSET r0, r1, r2
HALT
