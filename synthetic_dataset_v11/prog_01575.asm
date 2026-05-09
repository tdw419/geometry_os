; DESCRIPTION: Draws a red rectangle at (28, 28) with width 16 and height 112.
; PLAN: r0=28(x), r1=28(y), r2=16(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 28
LDI r2, 16
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
