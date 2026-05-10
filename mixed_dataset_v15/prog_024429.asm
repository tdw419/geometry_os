; DESCRIPTION: Renders a black box of size 53x89 starting at (198, 108).
; PLAN: r0=198(x), r1=108(y), r2=53(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 108
LDI r2, 53
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
