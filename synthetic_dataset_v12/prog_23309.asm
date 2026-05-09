; DESCRIPTION: Draws a red rectangle at (262, 44) with width 52 and height 10.
; PLAN: r0=262(x), r1=44(y), r2=52(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 44
LDI r2, 52
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
