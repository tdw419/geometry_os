; DESCRIPTION: Draws a red vertical line down the screen at x=222.
; PLAN: r0xFF0000(color). Op: FILL r0.
LDI r0, 222
LDI r1, 6
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
