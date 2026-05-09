; DESCRIPTION: Draws a magenta rectangle at (82, 112) with width 75 and height 64.
; PLAN: r0=82(x), r1=112(y), r2=75(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 112
LDI r2, 75
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
