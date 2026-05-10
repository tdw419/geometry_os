; DESCRIPTION: Draws a magenta rectangle at (387, 91) with width 18 and height 112.
; PLAN: r0=387(x), r1=91(y), r2=18(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 91
LDI r2, 18
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
