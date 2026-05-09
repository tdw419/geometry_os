; DESCRIPTION: Draws a white rectangle at (222, 109) with width 17 and height 16.
; PLAN: r0=222(x), r1=109(y), r2=17(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 109
LDI r2, 17
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
