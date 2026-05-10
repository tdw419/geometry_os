; DESCRIPTION: Draws a magenta cross in the center of the screen (horizontal + vertical lines).
; PLAN: r0=0(x), r1=24(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 0
LDI r1, 24
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
