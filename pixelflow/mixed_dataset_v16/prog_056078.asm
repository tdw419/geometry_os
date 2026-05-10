; DESCRIPTION: Draws a magenta rectangle at (58, 46) with width 120 and height 95.
; PLAN: r0=58(x), r1=46(y), r2=120(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 46
LDI r2, 120
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
