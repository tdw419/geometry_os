; DESCRIPTION: Draws a yellow rectangle at (384, 74) with width 80 and height 13.
; PLAN: r0=384(x), r1=74(y), r2=80(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 74
LDI r2, 80
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
