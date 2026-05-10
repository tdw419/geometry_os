; DESCRIPTION: Draws a red rectangle at (8, 70) with width 36 and height 86.
; PLAN: r0=8(x), r1=70(y), r2=36(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 70
LDI r2, 36
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
