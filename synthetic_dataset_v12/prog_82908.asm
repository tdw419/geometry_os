; DESCRIPTION: Renders a orange box of size 115x101 starting at (305, 101).
; PLAN: r0=305(x), r1=101(y), r2=115(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 101
LDI r2, 115
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
