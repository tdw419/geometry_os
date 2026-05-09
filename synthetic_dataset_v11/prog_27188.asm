; DESCRIPTION: Draws a blue rectangle at (95, 187) with width 54 and height 27.
; PLAN: r0=95(x), r1=187(y), r2=54(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 187
LDI r2, 54
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
