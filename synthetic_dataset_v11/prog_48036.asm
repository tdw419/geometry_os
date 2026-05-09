; DESCRIPTION: Draws a blue rectangle at (86, 129) with width 48 and height 43.
; PLAN: r0=86(x), r1=129(y), r2=48(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 129
LDI r2, 48
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
