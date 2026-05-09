; DESCRIPTION: Renders a orange box of size 68x81 starting at (14, 59).
; PLAN: r0=14(x), r1=59(y), r2=68(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 59
LDI r2, 68
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
