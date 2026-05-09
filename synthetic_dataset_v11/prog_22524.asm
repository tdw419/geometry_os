; DESCRIPTION: Draws a magenta rectangle at (197, 137) with width 41 and height 50.
; PLAN: r0=197(x), r1=137(y), r2=41(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 137
LDI r2, 41
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
