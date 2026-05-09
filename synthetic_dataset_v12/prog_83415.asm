; DESCRIPTION: Draws a white rectangle at (57, 16) with width 91 and height 75.
; PLAN: r0=57(x), r1=16(y), r2=91(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 16
LDI r2, 91
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
