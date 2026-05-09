; DESCRIPTION: Draws a red rectangle at (101, 17) with width 120 and height 24.
; PLAN: r0=101(x), r1=17(y), r2=120(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 17
LDI r2, 120
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
