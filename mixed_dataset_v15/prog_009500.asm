; DESCRIPTION: Draws a red vertical line down the screen at x=394.
; PLAN: r0xFF0000(color). Op: FILL r0.
LDI r0, 394
LDI r1, 0xFF00000000
LINE r0, r1, r2, r3, r4
HALT
