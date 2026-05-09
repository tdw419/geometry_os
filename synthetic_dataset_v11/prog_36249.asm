; DESCRIPTION: Draws a white rectangle at (137, 221) with width 96 and height 21.
; PLAN: r0=137(x), r1=221(y), r2=96(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 221
LDI r2, 96
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
