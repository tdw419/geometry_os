; DESCRIPTION: Sets a single magenta pixel at (84, 154).
; PLAN: r0=84(x), r1=154(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 84
LDI r1, 154
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
