; DESCRIPTION: Draws a red rectangle at (125, 4) with width 36 and height 95.
; PLAN: r0=125(x), r1=4(y), r2=36(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 4
LDI r2, 36
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
