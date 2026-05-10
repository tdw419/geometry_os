; DESCRIPTION: Draws a purple horizontal line across the screen at y=187.
; PLAN: r0xAA00FF(color). Op: FILL r0.
LDI r0, 0xAA00FF
FILL r0
HALT
