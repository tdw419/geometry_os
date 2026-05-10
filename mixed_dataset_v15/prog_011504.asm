; DESCRIPTION: Renders a black box of size 114x77 starting at (304, 45).
; PLAN: r0=304(x), r1=45(y), r2=114(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 45
LDI r2, 114
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
