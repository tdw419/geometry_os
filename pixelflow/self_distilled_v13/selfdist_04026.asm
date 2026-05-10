; DESCRIPTION: Draws a orange cross in the center of the screen (horizontal + vertical lines).
; PLAN: r0=30(x), r1=10(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 30
LDI r1, 10
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
