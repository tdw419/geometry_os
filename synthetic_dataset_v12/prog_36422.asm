; DESCRIPTION: Draws a red rectangle at (314, 32) with width 40 and height 54.
; PLAN: r0=314(x), r1=32(y), r2=40(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 32
LDI r2, 40
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
