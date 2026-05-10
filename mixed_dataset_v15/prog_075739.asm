; DESCRIPTION: Draws a red cross in the center of the screen (horizontal + vertical lines).
; PLAN: r0=2(x), r1=10(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 2
LDI r1, 10
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
