; DESCRIPTION: Draws a white rectangle at (277, 28) with width 20 and height 14.
; PLAN: r0=277(x), r1=28(y), r2=20(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 28
LDI r2, 20
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
