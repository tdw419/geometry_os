; DESCRIPTION: Draws a red rectangle at (262, 15) with width 90 and height 100.
; PLAN: r0=262(x), r1=15(y), r2=90(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 15
LDI r2, 90
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
