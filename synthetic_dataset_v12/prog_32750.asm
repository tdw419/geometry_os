; DESCRIPTION: Draws a blue rectangle at (9, 168) with width 109 and height 54.
; PLAN: r0=9(x), r1=168(y), r2=109(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 168
LDI r2, 109
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
