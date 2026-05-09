; DESCRIPTION: Renders a black box of size 37x73 starting at (13, 46).
; PLAN: r0=13(x), r1=46(y), r2=37(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 46
LDI r2, 37
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
