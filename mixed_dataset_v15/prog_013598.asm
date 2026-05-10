; DESCRIPTION: Draws a white cross in the center of the screen (horizontal + vertical lines).
; PLAN: r0=1(x), r1=17(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 1
LDI r1, 17
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
