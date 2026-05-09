; DESCRIPTION: Draws a red rectangle at (73, 79) with width 74 and height 28.
; PLAN: r0=73(x), r1=79(y), r2=74(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 79
LDI r2, 74
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
