; DESCRIPTION: Draws a yellow rectangle at (231, 129) with width 67 and height 118.
; PLAN: r0=231(x), r1=129(y), r2=67(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 129
LDI r2, 67
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
