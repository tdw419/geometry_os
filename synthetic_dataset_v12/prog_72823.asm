; DESCRIPTION: Draws a white rectangle at (225, 50) with width 25 and height 91.
; PLAN: r0=225(x), r1=50(y), r2=25(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 50
LDI r2, 25
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
