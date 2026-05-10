; DESCRIPTION: Draws a orange rectangle at (209, 61) with width 120 and height 10.
; PLAN: r0=209(x), r1=61(y), r2=120(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 61
LDI r2, 120
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
