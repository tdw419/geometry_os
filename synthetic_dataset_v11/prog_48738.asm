; DESCRIPTION: Renders a black box of size 114x47 starting at (33, 85).
; PLAN: r0=33(x), r1=85(y), r2=114(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 85
LDI r2, 114
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
