; DESCRIPTION: Draws a white rectangle at (196, 104) with width 56 and height 32.
; PLAN: r0=196(x), r1=104(y), r2=56(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 104
LDI r2, 56
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
