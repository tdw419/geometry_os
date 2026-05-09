; DESCRIPTION: Draws a green rectangle at (381, 129) with width 22 and height 60.
; PLAN: r0=381(x), r1=129(y), r2=22(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 129
LDI r2, 22
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
