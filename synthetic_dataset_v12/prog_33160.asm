; DESCRIPTION: Renders a orange box of size 16x93 starting at (430, 132).
; PLAN: r0=430(x), r1=132(y), r2=16(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 132
LDI r2, 16
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
