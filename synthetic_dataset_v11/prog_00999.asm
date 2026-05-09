; DESCRIPTION: Draws a magenta rectangle at (197, 164) with width 58 and height 26.
; PLAN: r0=197(x), r1=164(y), r2=58(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 164
LDI r2, 58
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
