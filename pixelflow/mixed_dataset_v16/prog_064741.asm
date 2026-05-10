; DESCRIPTION: Renders a green box of size 14x19 starting at (183, 81).
; PLAN: r0=183(x), r1=81(y), r2=14(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 81
LDI r2, 14
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
