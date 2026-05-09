; DESCRIPTION: Draws a red rectangle at (189, 1) with width 71 and height 34.
; PLAN: r0=189(x), r1=1(y), r2=71(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 1
LDI r2, 71
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
