; DESCRIPTION: Draws a white rectangle at (242, 104) with width 22 and height 114.
; PLAN: r0=242(x), r1=104(y), r2=22(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 104
LDI r2, 22
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
