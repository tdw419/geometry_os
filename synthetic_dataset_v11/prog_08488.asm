; DESCRIPTION: Draws a red rectangle at (45, 49) with width 98 and height 38.
; PLAN: r0=45(x), r1=49(y), r2=98(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 49
LDI r2, 98
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
