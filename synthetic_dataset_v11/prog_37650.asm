; DESCRIPTION: Renders a black box of size 46x53 starting at (47, 94).
; PLAN: r0=47(x), r1=94(y), r2=46(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 94
LDI r2, 46
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
