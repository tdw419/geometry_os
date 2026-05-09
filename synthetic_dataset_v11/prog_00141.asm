; DESCRIPTION: Draws a red rectangle at (10, 1) with width 120 and height 40.
; PLAN: r0=10(x), r1=1(y), r2=120(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 1
LDI r2, 120
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
