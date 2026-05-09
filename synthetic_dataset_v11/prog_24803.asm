; DESCRIPTION: Draws a white rectangle at (27, 14) with width 74 and height 91.
; PLAN: r0=27(x), r1=14(y), r2=74(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 14
LDI r2, 74
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
