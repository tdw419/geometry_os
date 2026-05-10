; DESCRIPTION: Draws a red rectangle at (308, 115) with width 55 and height 62.
; PLAN: r0=308(x), r1=115(y), r2=55(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 115
LDI r2, 55
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
