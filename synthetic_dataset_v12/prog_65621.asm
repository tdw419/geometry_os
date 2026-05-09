; DESCRIPTION: Draws a red rectangle at (261, 86) with width 63 and height 94.
; PLAN: r0=261(x), r1=86(y), r2=63(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 86
LDI r2, 63
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
