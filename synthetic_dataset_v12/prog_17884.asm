; DESCRIPTION: Draws a yellow rectangle at (284, 38) with width 37 and height 66.
; PLAN: r0=284(x), r1=38(y), r2=37(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 38
LDI r2, 37
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
