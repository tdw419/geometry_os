; DESCRIPTION: Draws a purple cross in the center of the screen (horizontal + vertical lines).
; PLAN: r0=0xAA00FF(color). Op: FILL r0.
LDI r0, 0xAA00FF
FILL r0
HALT
