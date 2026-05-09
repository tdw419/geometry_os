; DESCRIPTION: Renders a orange box of size 13x99 starting at (65, 93).
; PLAN: r0=65(x), r1=93(y), r2=13(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 93
LDI r2, 13
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
