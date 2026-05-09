; DESCRIPTION: Draws a yellow rectangle at (284, 2) with width 120 and height 101.
; PLAN: r0=284(x), r1=2(y), r2=120(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 2
LDI r2, 120
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
