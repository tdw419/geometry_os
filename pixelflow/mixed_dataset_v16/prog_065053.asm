; DESCRIPTION: Draws a red rectangle at (226, 76) with width 54 and height 25.
; PLAN: r0=226(x), r1=76(y), r2=54(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 76
LDI r2, 54
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
