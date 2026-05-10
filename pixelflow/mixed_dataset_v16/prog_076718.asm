; DESCRIPTION: Draws a green rectangle at (277, 38) with width 28 and height 57.
; PLAN: r0=277(x), r1=38(y), r2=28(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 38
LDI r2, 28
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
