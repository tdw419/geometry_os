; DESCRIPTION: Sets a single orange pixel at (292, 154).
; PLAN: r0=292(x), r1=154(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 292
LDI r1, 154
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
