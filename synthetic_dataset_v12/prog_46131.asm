; DESCRIPTION: Draws a white rectangle at (253, 221) with width 80 and height 34.
; PLAN: r0=253(x), r1=221(y), r2=80(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 221
LDI r2, 80
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
