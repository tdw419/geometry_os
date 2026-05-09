; DESCRIPTION: Draws a red rectangle at (21, 49) with width 40 and height 77.
; PLAN: r0=21(x), r1=49(y), r2=40(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 49
LDI r2, 40
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
