; DESCRIPTION: Draws a yellow rectangle at (85, 127) with width 42 and height 74.
; PLAN: r0=85(x), r1=127(y), r2=42(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 127
LDI r2, 42
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
