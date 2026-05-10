; DESCRIPTION: Renders a orange box of size 93x36 starting at (175, 6).
; PLAN: r0=175(x), r1=6(y), r2=93(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 6
LDI r2, 93
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
