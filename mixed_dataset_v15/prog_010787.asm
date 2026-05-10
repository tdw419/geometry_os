; DESCRIPTION: Draws a red vertical line down the screen at x=68.
; PLAN: r0=68(x1), r1=10(y1), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 68
LDI r1, 10
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
