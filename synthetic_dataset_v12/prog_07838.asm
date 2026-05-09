; DESCRIPTION: Draws a magenta rectangle at (255, 187) with width 113 and height 45.
; PLAN: r0=255(x), r1=187(y), r2=113(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 187
LDI r2, 113
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
