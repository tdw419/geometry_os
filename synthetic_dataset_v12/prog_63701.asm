; DESCRIPTION: Draws a green rectangle at (330, 185) with width 54 and height 27.
; PLAN: r0=330(x), r1=185(y), r2=54(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 185
LDI r2, 54
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
