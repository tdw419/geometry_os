; DESCRIPTION: Renders a black box of size 82x97 starting at (61, 34).
; PLAN: r0=61(x), r1=34(y), r2=82(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 34
LDI r2, 82
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
