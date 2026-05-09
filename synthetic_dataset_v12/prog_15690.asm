; DESCRIPTION: Draws a orange rectangle at (262, 20) with width 95 and height 61.
; PLAN: r0=262(x), r1=20(y), r2=95(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 20
LDI r2, 95
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
