; DESCRIPTION: Draws a blue rectangle at (154, 98) with width 35 and height 36.
; PLAN: r0=154(x), r1=98(y), r2=35(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 98
LDI r2, 35
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
