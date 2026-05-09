; DESCRIPTION: Draws a red rectangle at (220, 135) with width 52 and height 24.
; PLAN: r0=220(x), r1=135(y), r2=52(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 135
LDI r2, 52
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
