; DESCRIPTION: Draws a green rectangle at (282, 129) with width 99 and height 32.
; PLAN: r0=282(x), r1=129(y), r2=99(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 129
LDI r2, 99
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
