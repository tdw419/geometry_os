; DESCRIPTION: Renders a orange box of size 25x93 starting at (385, 157).
; PLAN: r0=385(x), r1=157(y), r2=25(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 157
LDI r2, 25
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
