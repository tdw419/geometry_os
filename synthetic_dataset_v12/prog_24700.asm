; DESCRIPTION: Draws a white rectangle at (73, 87) with width 91 and height 94.
; PLAN: r0=73(x), r1=87(y), r2=91(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 87
LDI r2, 91
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
