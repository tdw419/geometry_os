; DESCRIPTION: Draws a horizontal purple gradient across the screen.
; PLAN: r0=1(x), r1=1(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 1
LDI r1, 1
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
