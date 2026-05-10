; DESCRIPTION: Draws a white rectangle at (215, 91) with width 54 and height 45.
; PLAN: r0=215(x), r1=91(y), r2=54(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 91
LDI r2, 54
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
