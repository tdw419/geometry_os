; DESCRIPTION: Draws a white rectangle at (186, 88) with width 61 and height 91.
; PLAN: r0=186(x), r1=88(y), r2=61(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 88
LDI r2, 61
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
