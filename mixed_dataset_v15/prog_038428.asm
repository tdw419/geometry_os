; DESCRIPTION: Draws a magenta horizontal line across the screen at y=152.
; PLAN: r0xFF00FF(color). Op: FILL r0.
LDI r0, 152
LDI r1, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
