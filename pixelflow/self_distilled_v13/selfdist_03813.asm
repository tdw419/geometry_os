; DESCRIPTION: Draws a white cross in the center of the screen (horizontal + vertical lines).
; PLAN: r0=0(x), r1=10(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 0
LDI r1, 10
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
