; DESCRIPTION: Draws a purple cross in the center of the screen (horizontal + vertical lines).
; PLAN: r0=3(x), r1=27(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 27
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
