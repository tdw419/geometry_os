; DESCRIPTION: Renders a orange box of size 39x96 starting at (473, 65).
; PLAN: r0=473(x), r1=65(y), r2=39(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 65
LDI r2, 39
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
