; DESCRIPTION: Draws a blue cross in the center of the screen (horizontal + vertical lines).
; PLAN: r0=0(x), r1=17(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 0
LDI r1, 17
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
