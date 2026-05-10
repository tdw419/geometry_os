; DESCRIPTION: Draws a orange cross in the center of the screen (horizontal + vertical lines).
; PLAN: r0=0(x), r1=17(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 0xFF8800
FILL r0
HALT
