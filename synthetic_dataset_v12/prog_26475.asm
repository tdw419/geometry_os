; DESCRIPTION: Draws a red rectangle at (337, 89) with width 36 and height 59.
; PLAN: r0=337(x), r1=89(y), r2=36(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 89
LDI r2, 36
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
