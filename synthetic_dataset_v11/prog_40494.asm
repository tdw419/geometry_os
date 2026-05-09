; DESCRIPTION: Renders a black box of size 78x44 starting at (128, 162).
; PLAN: r0=128(x), r1=162(y), r2=78(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 162
LDI r2, 78
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
