; DESCRIPTION: Draws a red rectangle at (220, 94) with width 63 and height 71.
; PLAN: r0=220(x), r1=94(y), r2=63(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 94
LDI r2, 63
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
