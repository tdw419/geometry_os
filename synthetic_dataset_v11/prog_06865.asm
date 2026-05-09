; DESCRIPTION: Draws a white rectangle at (124, 152) with width 114 and height 54.
; PLAN: r0=124(x), r1=152(y), r2=114(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 152
LDI r2, 114
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
