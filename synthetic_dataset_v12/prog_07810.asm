; DESCRIPTION: Draws a green rectangle at (433, 164) with width 72 and height 11.
; PLAN: r0=433(x), r1=164(y), r2=72(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 164
LDI r2, 72
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
