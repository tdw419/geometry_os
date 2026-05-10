; DESCRIPTION: Draws a magenta cross in the center of the screen (horizontal + vertical lines).
; PLAN: r0=0xFF00FF(color). Op: FILL r0.
LDI r0, 0xFF00FF
FILL r0
HALT
