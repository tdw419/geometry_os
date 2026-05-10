; DESCRIPTION: Draws a cyan vertical line down the screen at x=70.
; PLAN: r0=70(x1), r1=1(y1), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 70
LDI r1, 1
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
