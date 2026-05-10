; DESCRIPTION: Draws a horizontal magenta gradient across the screen.
; PLAN: r0=1(x), r1=1(y), r2=0xFF00FF(color). Op: FILL r0.
LDI r0, 1
LDI r1, 1
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
