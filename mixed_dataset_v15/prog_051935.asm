; DESCRIPTION: Draws a white rectangle at (74, 211) with width 61 and height 44.
; PLAN: r0=74(x), r1=211(y), r2=61(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 211
LDI r2, 61
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
