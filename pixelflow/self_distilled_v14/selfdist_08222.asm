; DESCRIPTION: Draws a purple horizontal line across the screen at y=27.
; PLAN: r0xAA00FF(color). Op: FILL r0.
LDI r0, 27
LDI r1, 0xAA00FFF
FILL r0
HALT
