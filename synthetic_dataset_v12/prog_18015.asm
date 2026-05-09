; DESCRIPTION: Draws a white rectangle at (112, 190) with width 104 and height 61.
; PLAN: r0=112(x), r1=190(y), r2=104(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 190
LDI r2, 104
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
