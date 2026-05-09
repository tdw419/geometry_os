; DESCRIPTION: Draws a red rectangle at (45, 73) with width 83 and height 52.
; PLAN: r0=45(x), r1=73(y), r2=83(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 73
LDI r2, 83
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
