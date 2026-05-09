; DESCRIPTION: Draws a black rectangle at (161, 126) with width 62 and height 50.
; PLAN: r0=161(x), r1=126(y), r2=62(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 126
LDI r2, 62
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
