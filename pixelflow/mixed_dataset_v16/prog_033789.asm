; DESCRIPTION: Draws a red rectangle at (324, 45) with width 98 and height 115.
; PLAN: r0=324(x), r1=45(y), r2=98(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 45
LDI r2, 98
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
