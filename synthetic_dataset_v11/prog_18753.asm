; DESCRIPTION: Draws a magenta rectangle at (21, 91) with width 50 and height 68.
; PLAN: r0=21(x), r1=91(y), r2=50(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 91
LDI r2, 50
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
