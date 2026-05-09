; DESCRIPTION: Draws a white rectangle at (0, 190) with width 58 and height 40.
; PLAN: r0=0(x), r1=190(y), r2=58(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 190
LDI r2, 58
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
