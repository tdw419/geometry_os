; DESCRIPTION: Draws a black rectangle at (126, 45) with width 38 and height 40.
; PLAN: r0=126(x), r1=45(y), r2=38(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 45
LDI r2, 38
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
