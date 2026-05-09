; DESCRIPTION: Renders a black box of size 100x27 starting at (319, 175).
; PLAN: r0=319(x), r1=175(y), r2=100(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 175
LDI r2, 100
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
