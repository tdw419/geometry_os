; DESCRIPTION: Sets a single magenta pixel at (48, 154).
; PLAN: r0=48(x), r1=154(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 48
LDI r1, 154
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
