; DESCRIPTION: Draws a red rectangle at (220, 134) with width 24 and height 19.
; PLAN: r0=220(x), r1=134(y), r2=24(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 134
LDI r2, 24
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
