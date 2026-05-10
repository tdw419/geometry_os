; DESCRIPTION: Draws a purple rectangle at (50, 146) with width 83 and height 108.
; PLAN: r0=50(x), r1=146(y), r2=83(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 146
LDI r2, 83
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
