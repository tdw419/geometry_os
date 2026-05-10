; DESCRIPTION: Draws a cyan vertical line down the screen at x=59.
; PLAN: r0=59(x1), r1=10(y1), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 59
LDI r1, 10
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
