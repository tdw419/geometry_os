; DESCRIPTION: Draws a magenta rectangle at (305, 154) with width 49 and height 26.
; PLAN: r0=305(x), r1=154(y), r2=49(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 154
LDI r2, 49
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
