; DESCRIPTION: Draws a purple rectangle at (91, 186) with width 24 and height 50.
; PLAN: r0=91(x), r1=186(y), r2=24(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 186
LDI r2, 24
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
