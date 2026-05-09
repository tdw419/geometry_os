; DESCRIPTION: Renders a orange box of size 93x32 starting at (73, 88).
; PLAN: r0=73(x), r1=88(y), r2=93(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 88
LDI r2, 93
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
