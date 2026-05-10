; DESCRIPTION: Draws a horizontal purple gradient across the screen.
; PLAN: r0=37(x), r1=17(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 37
LDI r1, 17
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
