; DESCRIPTION: Draws a magenta rectangle at (214, 15) with width 64 and height 10.
; PLAN: r0=214(x), r1=15(y), r2=64(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 15
LDI r2, 64
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
