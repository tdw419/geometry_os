; DESCRIPTION: Draws a orange horizontal line across the screen at y=158.
; PLAN: r0xFF8800(color). Op: FILL r0.
LDI r0, 158
LDI r1, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
