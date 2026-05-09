; DESCRIPTION: Draws a magenta rectangle at (124, 39) with width 45 and height 66.
; PLAN: r0=124(x), r1=39(y), r2=45(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 39
LDI r2, 45
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
