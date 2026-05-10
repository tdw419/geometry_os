; DESCRIPTION: Draws a white vertical line down the screen at x=318.
; PLAN: r0xFFFFFF(color). Op: FILL r0.
LDI r0, 318
LDI r1, 0xFFFFFFF
LINE r0, r1, r2, r3, r4
HALT
