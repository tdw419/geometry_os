; DESCRIPTION: Draws a white rectangle at (153, 126) with width 70 and height 91.
; PLAN: r0=153(x), r1=126(y), r2=70(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 126
LDI r2, 70
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
