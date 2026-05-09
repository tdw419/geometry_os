; DESCRIPTION: Draws a red rectangle at (195, 15) with width 109 and height 54.
; PLAN: r0=195(x), r1=15(y), r2=109(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 15
LDI r2, 109
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
