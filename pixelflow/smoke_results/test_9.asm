; DESCRIPTION: Draws a horizontal red line across the middle of the screen.
; PLAN: r0=90(x1), r2=21(y2), r4=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 78
LDI r1, 196
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT