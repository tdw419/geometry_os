; DESCRIPTION: Renders a orange box of size 103x81 starting at (101, 29).
; PLAN: r0=101(x), r1=29(y), r2=103(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 29
LDI r2, 103
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
