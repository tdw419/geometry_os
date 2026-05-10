; DESCRIPTION: Draws a black rectangle at (333, 45) with width 24 and height 80.
; PLAN: r0=333(x), r1=45(y), r2=24(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 45
LDI r2, 24
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
