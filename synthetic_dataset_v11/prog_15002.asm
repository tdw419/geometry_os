; DESCRIPTION: Draws a red rectangle at (14, 5) with width 120 and height 20.
; PLAN: r0=14(x), r1=5(y), r2=120(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 5
LDI r2, 120
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
