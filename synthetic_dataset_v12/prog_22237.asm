; DESCRIPTION: Draws a black rectangle at (412, 220) with width 48 and height 30.
; PLAN: r0=412(x), r1=220(y), r2=48(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 220
LDI r2, 48
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
