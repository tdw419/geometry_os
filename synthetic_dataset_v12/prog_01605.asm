; DESCRIPTION: Draws a magenta rectangle at (346, 50) with width 16 and height 65.
; PLAN: r0=346(x), r1=50(y), r2=16(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 50
LDI r2, 16
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
