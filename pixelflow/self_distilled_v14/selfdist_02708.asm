; DESCRIPTION: Draws a cyan vertical line down the screen at x=49.
; PLAN: r0=49(x1), r1=50(y1), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 49
LDI r1, 50
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
