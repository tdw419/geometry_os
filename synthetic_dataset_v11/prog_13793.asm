; DESCRIPTION: Draws a yellow rectangle at (33, 67) with width 98 and height 48.
; PLAN: r0=33(x), r1=67(y), r2=98(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 67
LDI r2, 98
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
