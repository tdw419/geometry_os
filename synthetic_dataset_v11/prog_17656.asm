; DESCRIPTION: Draws a white rectangle at (54, 87) with width 91 and height 51.
; PLAN: r0=54(x), r1=87(y), r2=91(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 87
LDI r2, 91
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
