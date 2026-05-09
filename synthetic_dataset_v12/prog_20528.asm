; DESCRIPTION: Draws a red rectangle at (112, 40) with width 31 and height 54.
; PLAN: r0=112(x), r1=40(y), r2=31(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 40
LDI r2, 31
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
