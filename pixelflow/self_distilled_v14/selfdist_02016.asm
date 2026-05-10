; DESCRIPTION: Draws a horizontal white gradient across the screen.
; PLAN: r0=1(x), r1=18(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 1
LDI r1, 18
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
