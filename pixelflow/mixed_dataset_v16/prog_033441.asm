; DESCRIPTION: Draws a red vertical line down the screen at x=50.
; PLAN: r0=50(x1), r1=10(y1), r2=0xFF0000(color). Op: FILL r0, r1, r2.
LDI r0, 50
LDI r1, 10
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
