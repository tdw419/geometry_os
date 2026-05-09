; DESCRIPTION: Draws a red rectangle at (135, 73) with width 99 and height 28.
; PLAN: r0=135(x), r1=73(y), r2=99(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 73
LDI r2, 99
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
