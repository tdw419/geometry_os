; DESCRIPTION: Draws a purple rectangle at (456, 161) with width 34 and height 50.
; PLAN: r0=456(x), r1=161(y), r2=34(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 161
LDI r2, 34
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
