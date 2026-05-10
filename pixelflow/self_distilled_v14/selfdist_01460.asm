; DESCRIPTION: Draws a white vertical line down the screen at x=82.
; PLAN: r0=82(x1), r1=10(y1), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 10
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
