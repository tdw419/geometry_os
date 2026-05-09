; DESCRIPTION: Renders a orange box of size 29x101 starting at (101, 143).
; PLAN: r0=101(x), r1=143(y), r2=29(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 143
LDI r2, 29
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
