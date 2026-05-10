; DESCRIPTION: Draws a green cross in the center of the screen (horizontal + vertical lines).
; PLAN: r0=4(x), r1=17(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 4
LDI r1, 17
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
