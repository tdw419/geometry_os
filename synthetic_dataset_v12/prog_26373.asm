; DESCRIPTION: Draws a green rectangle at (4, 168) with width 95 and height 25.
; PLAN: r0=4(x), r1=168(y), r2=95(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 168
LDI r2, 95
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
