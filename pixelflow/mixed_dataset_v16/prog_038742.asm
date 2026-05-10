; DESCRIPTION: Draws a cyan vertical line down the screen at x=79.
; PLAN: r0=79(x1), r1=1(y1), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 79
LDI r1, 1
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
