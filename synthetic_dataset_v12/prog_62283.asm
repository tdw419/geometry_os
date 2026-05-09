; DESCRIPTION: Renders a orange box of size 32x84 starting at (138, 93).
; PLAN: r0=138(x), r1=93(y), r2=32(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 93
LDI r2, 32
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
