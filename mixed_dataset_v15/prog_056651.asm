; DESCRIPTION: Renders a black box of size 97x38 starting at (393, 141).
; PLAN: r0=393(x), r1=141(y), r2=97(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 141
LDI r2, 97
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
