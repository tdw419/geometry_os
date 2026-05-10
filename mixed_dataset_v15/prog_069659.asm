; DESCRIPTION: Draws a magenta rectangle at (433, 74) with width 49 and height 60.
; PLAN: r0=433(x), r1=74(y), r2=49(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 74
LDI r2, 49
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
