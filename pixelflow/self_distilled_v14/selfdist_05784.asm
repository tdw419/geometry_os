; DESCRIPTION: Draws a white rectangle at (202, 190) with width 71 and height 88.
; PLAN: r0=202(x), r1=190(y), r2=71(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 190
LDI r2, 71
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
