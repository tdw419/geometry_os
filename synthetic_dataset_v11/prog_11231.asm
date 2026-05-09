; DESCRIPTION: Draws a yellow rectangle at (150, 57) with width 56 and height 110.
; PLAN: r0=150(x), r1=57(y), r2=56(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 57
LDI r2, 56
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
