; DESCRIPTION: Renders a black box of size 82x40 starting at (99, 212).
; PLAN: r0=99(x), r1=212(y), r2=82(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 212
LDI r2, 82
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
