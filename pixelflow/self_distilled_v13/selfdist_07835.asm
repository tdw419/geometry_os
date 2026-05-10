; DESCRIPTION: Sets a single white pixel at (237, 154).
; PLAN: r0=237(x), r1=154(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 154
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
