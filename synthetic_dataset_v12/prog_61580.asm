; DESCRIPTION: Draws a white rectangle at (435, 202) with width 61 and height 38.
; PLAN: r0=435(x), r1=202(y), r2=61(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 202
LDI r2, 61
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
