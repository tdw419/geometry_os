; DESCRIPTION: Renders a black box of size 82x59 starting at (149, 123).
; PLAN: r0=149(x), r1=123(y), r2=82(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 123
LDI r2, 82
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
