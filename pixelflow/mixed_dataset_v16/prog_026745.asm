; DESCRIPTION: Draws a white rectangle at (277, 204) with width 86 and height 38.
; PLAN: r0=277(x), r1=204(y), r2=86(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 204
LDI r2, 86
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
