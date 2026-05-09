; DESCRIPTION: Draws a magenta rectangle at (44, 196) with width 53 and height 34.
; PLAN: r0=44(x), r1=196(y), r2=53(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 196
LDI r2, 53
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
