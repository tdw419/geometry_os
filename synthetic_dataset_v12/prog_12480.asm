; DESCRIPTION: Draws a red rectangle at (190, 124) with width 74 and height 87.
; PLAN: r0=190(x), r1=124(y), r2=74(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 124
LDI r2, 74
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
