; DESCRIPTION: Draws a red vertical line down the screen at x=344.
; PLAN: r0xFF0000(color). Op: FILL r0.
LDI r0, 344
LDI r1, 0xFF00000000
LINE r0, r1, r2, r3, r4
HALT
