; DESCRIPTION: Draws a black rectangle at (346, 97) with width 45 and height 50.
; PLAN: r0=346(x), r1=97(y), r2=45(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 97
LDI r2, 45
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
