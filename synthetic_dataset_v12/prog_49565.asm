; DESCRIPTION: Draws a black rectangle at (171, 58) with width 60 and height 37.
; PLAN: r0=171(x), r1=58(y), r2=60(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 58
LDI r2, 60
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
