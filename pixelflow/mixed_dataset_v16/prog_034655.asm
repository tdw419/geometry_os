; DESCRIPTION: Draws a white rectangle at (284, 85) with width 52 and height 97.
; PLAN: r0=284(x), r1=85(y), r2=52(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 85
LDI r2, 52
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
