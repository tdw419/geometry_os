; DESCRIPTION: Draws a black rectangle at (256, 205) with width 58 and height 20.
; PLAN: r0=256(x), r1=205(y), r2=58(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 205
LDI r2, 58
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
