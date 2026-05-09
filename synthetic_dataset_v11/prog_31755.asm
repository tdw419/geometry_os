; DESCRIPTION: Renders a orange box of size 13x16 starting at (5, 175).
; PLAN: r0=5(x), r1=175(y), r2=13(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 175
LDI r2, 13
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
