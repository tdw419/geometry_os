; DESCRIPTION: Draws a red vertical line down the screen at x=100.
; PLAN: r0=100(x1), r1=0(y1), r2=0xFF0000(color). Op: FILL r0, r1, r2.
LDI r0, 100
LDI r1, 0
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
