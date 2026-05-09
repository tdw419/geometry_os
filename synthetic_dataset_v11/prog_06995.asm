; DESCRIPTION: Renders a red box of size 97x93 starting at (154, 23).
; PLAN: r0=154(x), r1=23(y), r2=97(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 23
LDI r2, 97
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
