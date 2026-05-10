; DESCRIPTION: Draws a white rectangle at (215, 30) with width 78 and height 50.
; PLAN: r0=215(x), r1=30(y), r2=78(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 30
LDI r2, 78
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
