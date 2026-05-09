; DESCRIPTION: Draws a green rectangle at (33, 152) with width 86 and height 74.
; PLAN: r0=33(x), r1=152(y), r2=86(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 152
LDI r2, 86
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
