; DESCRIPTION: Draws a cyan cross in the center of the screen (horizontal + vertical lines).
; PLAN: r0=6(x), r1=17(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 6
LDI r1, 17
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
