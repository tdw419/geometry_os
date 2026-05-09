; DESCRIPTION: Draws a yellow rectangle at (284, 48) with width 92 and height 49.
; PLAN: r0=284(x), r1=48(y), r2=92(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 48
LDI r2, 92
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
