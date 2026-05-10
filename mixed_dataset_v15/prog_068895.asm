; DESCRIPTION: Draws a magenta rectangle at (386, 74) with width 117 and height 19.
; PLAN: r0=386(x), r1=74(y), r2=117(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 74
LDI r2, 117
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
