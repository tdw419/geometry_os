; DESCRIPTION: Renders a black box of size 97x44 starting at (356, 181).
; PLAN: r0=356(x), r1=181(y), r2=97(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 181
LDI r2, 97
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
