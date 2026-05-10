; DESCRIPTION: Draws a horizontal orange gradient across the screen.
; PLAN: r0=0xFF8800(color). Op: FILL r0.
LDI r0, 0xFF8800
FILL r0
HALT
