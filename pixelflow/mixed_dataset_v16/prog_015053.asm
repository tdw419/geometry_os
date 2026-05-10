; DESCRIPTION: Draws a yellow horizontal line across the screen at y=164.
; PLAN: r0=0xFFFF00(color). Op: FILL r0.
LDI r0, 0xFFFF00
FILL r0
HALT
