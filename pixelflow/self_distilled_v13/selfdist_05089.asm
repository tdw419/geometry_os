; DESCRIPTION: Draws a cyan vertical line down the screen at x=107.
; PLAN: r0=0x1), r1=10(y1), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 0
LDI r1, 10
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
