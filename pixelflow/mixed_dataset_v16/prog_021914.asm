; DESCRIPTION: Renders a orange box of size 106x93 starting at (324, 118).
; PLAN: r0=324(x), r1=118(y), r2=106(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 118
LDI r2, 106
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
