; DESCRIPTION: Draws a white rectangle at (45, 91) with width 37 and height 50.
; PLAN: r0=45(x), r1=91(y), r2=37(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 91
LDI r2, 37
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
