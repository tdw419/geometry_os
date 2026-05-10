; DESCRIPTION: Draws a white vertical line down the screen at x=97.
; PLAN: r0=97(x1), r1=72(y1), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 97
LDI r1, 72
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
