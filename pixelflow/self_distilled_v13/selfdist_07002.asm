; DESCRIPTION: Draws a magenta cross in the center of the screen (horizontal + vertical lines).
; PLAN: r0=0(x), r1=72(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 0xFF00FF
FILL r0
HALT
