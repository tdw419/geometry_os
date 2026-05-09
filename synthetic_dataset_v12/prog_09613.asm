; DESCRIPTION: Draws a green rectangle at (290, 150) with width 54 and height 86.
; PLAN: r0=290(x), r1=150(y), r2=54(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 150
LDI r2, 54
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
