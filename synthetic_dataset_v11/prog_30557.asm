; DESCRIPTION: Renders a black box of size 66x44 starting at (167, 165).
; PLAN: r0=167(x), r1=165(y), r2=66(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 165
LDI r2, 66
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
