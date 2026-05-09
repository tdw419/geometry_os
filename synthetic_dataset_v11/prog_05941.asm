; DESCRIPTION: Renders a black box of size 119x27 starting at (114, 83).
; PLAN: r0=114(x), r1=83(y), r2=119(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 83
LDI r2, 119
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
