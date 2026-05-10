; DESCRIPTION: Draws a red rectangle at (140, 32) with width 18 and height 52.
; PLAN: r0=140(x), r1=32(y), r2=18(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 32
LDI r2, 18
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
