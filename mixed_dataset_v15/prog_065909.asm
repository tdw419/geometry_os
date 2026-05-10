; DESCRIPTION: Renders a orange box of size 39x93 starting at (435, 80).
; PLAN: r0=435(x), r1=80(y), r2=39(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 80
LDI r2, 39
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
