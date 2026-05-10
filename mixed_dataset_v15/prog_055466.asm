; DESCRIPTION: Draws a magenta vertical line down the screen at x=83.
; PLAN: r0xFF00FF(color). Op: FILL r0.
LDI r0, 0xFF00FF
FILL r0
HALT
