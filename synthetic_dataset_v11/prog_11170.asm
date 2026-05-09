; DESCRIPTION: Draws a blue rectangle at (102, 129) with width 95 and height 84.
; PLAN: r0=102(x), r1=129(y), r2=95(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 129
LDI r2, 95
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
