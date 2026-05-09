; DESCRIPTION: Draws a white rectangle at (314, 24) with width 103 and height 117.
; PLAN: r0=314(x), r1=24(y), r2=103(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 24
LDI r2, 103
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
