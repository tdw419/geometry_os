; DESCRIPTION: Draws a purple horizontal line across the screen at y=40.
; PLAN: r0=40(x1), r1=10(y1), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 40
LDI r1, 10
LDI r2, 0
LDI r3, 0xAA00FF
FILL r0
HALT
