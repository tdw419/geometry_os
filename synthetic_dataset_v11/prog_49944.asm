; DESCRIPTION: Draws a white rectangle at (91, 127) with width 63 and height 77.
; PLAN: r0=91(x), r1=127(y), r2=63(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 127
LDI r2, 63
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
