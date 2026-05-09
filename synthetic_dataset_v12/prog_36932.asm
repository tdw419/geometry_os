; DESCRIPTION: Draws a red rectangle at (262, 77) with width 23 and height 25.
; PLAN: r0=262(x), r1=77(y), r2=23(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 77
LDI r2, 23
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
