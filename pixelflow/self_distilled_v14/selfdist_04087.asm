; DESCRIPTION: Draws a green vertical line down the screen at x=65.
; PLAN: r0=65(x1), r1=10(y1), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 65
LDI r1, 10
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
