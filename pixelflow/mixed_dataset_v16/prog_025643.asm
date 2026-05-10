; DESCRIPTION: Draws a red vertical line down the screen at x=28.
; PLAN: r0=28(x1), r1=1(y1), r2=0xFF0000(color). Op: FILL r0, r1, r2.
LDI r0, 28
LDI r1, 1
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
