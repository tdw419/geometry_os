; DESCRIPTION: Draws a magenta rectangle at (305, 39) with width 107 and height 23.
; PLAN: r0=305(x), r1=39(y), r2=107(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 39
LDI r2, 107
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
