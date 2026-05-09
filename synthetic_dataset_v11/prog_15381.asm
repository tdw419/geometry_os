; DESCRIPTION: Renders a black box of size 34x103 starting at (44, 135).
; PLAN: r0=44(x), r1=135(y), r2=34(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 135
LDI r2, 34
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
