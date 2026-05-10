; DESCRIPTION: Draws a red rectangle at (186, 195) with width 69 and height 63.
; PLAN: r0=186(x), r1=195(y), r2=69(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 195
LDI r2, 69
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
