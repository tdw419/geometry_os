; DESCRIPTION: Draws a white rectangle at (438, 64) with width 30 and height 18.
; PLAN: r0=438(x), r1=64(y), r2=30(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 64
LDI r2, 30
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
