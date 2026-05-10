; DESCRIPTION: Draws a purple rectangle at (120, 187) with width 68 and height 65.
; PLAN: r0=120(x), r1=187(y), r2=68(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 187
LDI r2, 68
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
