; DESCRIPTION: Draws a purple cross in the center of the screen (horizontal + vertical lines).
; PLAN: r0=0(x), r1=17(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 0xAA00FF
FILL r0
HALT
