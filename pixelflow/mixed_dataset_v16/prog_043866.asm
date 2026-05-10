; DESCRIPTION: Draws a red vertical line down the screen at x=209.
; PLAN: r0xFF0000(color). Op: FILL r0.
LDI r0, 0xFF0000
FILL r0
HALT
