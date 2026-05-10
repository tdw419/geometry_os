; DESCRIPTION: Draws a horizontal yellow gradient across the screen.
; PLAN: r0=0xFFFF00(color). Op: FILL r0.
LDI r0, 0xFFFF00
FILL r0
HALT
