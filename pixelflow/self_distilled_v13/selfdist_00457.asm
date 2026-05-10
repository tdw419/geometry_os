; DESCRIPTION: Creates a vertical magenta gradient from black to magenta.
; PLAN: r0=4(x), r1=1(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 4
LDI r1, 1
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
