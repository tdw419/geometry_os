; DESCRIPTION: Draws a red rectangle at (20, 40) with width 54 and height 64.
; PLAN: r0=20(x), r1=40(y), r2=54(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 40
LDI r2, 54
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
