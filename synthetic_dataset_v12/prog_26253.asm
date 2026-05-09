; DESCRIPTION: Renders a orange box of size 93x107 starting at (183, 144).
; PLAN: r0=183(x), r1=144(y), r2=93(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 144
LDI r2, 93
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
