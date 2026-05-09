; DESCRIPTION: Draws a white rectangle at (84, 127) with width 109 and height 91.
; PLAN: r0=84(x), r1=127(y), r2=109(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 127
LDI r2, 109
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
