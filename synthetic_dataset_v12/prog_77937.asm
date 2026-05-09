; DESCRIPTION: Draws a red rectangle at (306, 151) with width 48 and height 89.
; PLAN: r0=306(x), r1=151(y), r2=48(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 151
LDI r2, 48
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
