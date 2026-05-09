; DESCRIPTION: Draws a magenta rectangle at (387, 148) with width 39 and height 108.
; PLAN: r0=387(x), r1=148(y), r2=39(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 148
LDI r2, 39
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
