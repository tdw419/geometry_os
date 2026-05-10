; DESCRIPTION: Draws a orange cross in the center of the screen (horizontal + vertical lines).
; PLAN: r0=0(x), r1=14(y), r2=0(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 0
LDI r1, 14
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
