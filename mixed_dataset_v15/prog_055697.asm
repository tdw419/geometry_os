; DESCRIPTION: Draws a black rectangle at (271, 7) with width 117 and height 76.
; PLAN: r0=271(x), r1=7(y), r2=117(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 7
LDI r2, 117
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
