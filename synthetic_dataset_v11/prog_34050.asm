; DESCRIPTION: Draws a red rectangle at (70, 20) with width 18 and height 86.
; PLAN: r0=70(x), r1=20(y), r2=18(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 20
LDI r2, 18
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
