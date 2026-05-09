; DESCRIPTION: Renders a black box of size 97x27 starting at (35, 60).
; PLAN: r0=35(x), r1=60(y), r2=97(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 60
LDI r2, 97
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
