; DESCRIPTION: Draws a magenta rectangle at (290, 0) with width 45 and height 13.
; PLAN: r0=290(x), r1=0(y), r2=45(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 0
LDI r2, 45
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
