; DESCRIPTION: Draws a magenta rectangle at (386, 12) with width 107 and height 39.
; PLAN: r0=386(x), r1=12(y), r2=107(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 12
LDI r2, 107
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
