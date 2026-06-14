; DESCRIPTION: Draws a horizontal red line across the middle of the screen.
; PLAN: r0=0xFF0000(color). Op: FILL r0.
LDI r0, 0xFF0000
FILL r0
HALT