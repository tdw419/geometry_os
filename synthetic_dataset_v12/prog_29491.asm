; DESCRIPTION: Renders a black box of size 102x66 starting at (161, 37).
; PLAN: r0=161(x), r1=37(y), r2=102(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 37
LDI r2, 102
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
