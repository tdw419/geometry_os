; DESCRIPTION: Draws a white rectangle at (50, 70) with width 91 and height 83.
; PLAN: r0=50(x), r1=70(y), r2=91(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 70
LDI r2, 91
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
