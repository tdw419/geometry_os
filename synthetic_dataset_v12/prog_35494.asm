; DESCRIPTION: Draws a black rectangle at (284, 141) with width 37 and height 34.
; PLAN: r0=284(x), r1=141(y), r2=37(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 141
LDI r2, 37
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
