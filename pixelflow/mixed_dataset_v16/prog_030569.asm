; DESCRIPTION: Draws a magenta rectangle at (474, 50) with width 21 and height 120.
; PLAN: r0=474(x), r1=50(y), r2=21(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 50
LDI r2, 21
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
