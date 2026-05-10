; DESCRIPTION: Draws a magenta rectangle at (277, 32) with width 16 and height 56.
; PLAN: r0=277(x), r1=32(y), r2=16(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 32
LDI r2, 16
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
