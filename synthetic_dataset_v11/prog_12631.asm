; DESCRIPTION: Draws a green rectangle at (198, 0) with width 58 and height 102.
; PLAN: r0=198(x), r1=0(y), r2=58(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 0
LDI r2, 58
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
