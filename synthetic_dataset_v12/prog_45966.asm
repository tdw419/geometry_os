; DESCRIPTION: Draws a magenta rectangle at (308, 33) with width 100 and height 48.
; PLAN: r0=308(x), r1=33(y), r2=100(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 33
LDI r2, 100
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
