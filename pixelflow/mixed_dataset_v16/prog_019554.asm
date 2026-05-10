; DESCRIPTION: Draws a red vertical line down the screen at x=392.
; PLAN: r0xFF0000(color). Op: FILL r0.
LDI r0, 392
LDI r1, 6
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
