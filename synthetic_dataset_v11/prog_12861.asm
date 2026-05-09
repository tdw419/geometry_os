; DESCRIPTION: Draws a red rectangle at (150, 37) with width 28 and height 89.
; PLAN: r0=150(x), r1=37(y), r2=28(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 37
LDI r2, 28
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
