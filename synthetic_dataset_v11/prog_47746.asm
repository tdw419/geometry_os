; DESCRIPTION: Draws a green rectangle at (135, 154) with width 54 and height 86.
; PLAN: r0=135(x), r1=154(y), r2=54(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 154
LDI r2, 54
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
