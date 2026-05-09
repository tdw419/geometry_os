; DESCRIPTION: Renders a black box of size 23x46 starting at (189, 120).
; PLAN: r0=189(x), r1=120(y), r2=23(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 120
LDI r2, 23
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
