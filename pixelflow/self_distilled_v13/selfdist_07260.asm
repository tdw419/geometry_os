; DESCRIPTION: Draws a horizontal white gradient across the screen.
; PLAN: r0=0xFFFFFF(color). Op: FILL r0.
LDI r0, 0xFFFFFF
FILL r0
HALT
