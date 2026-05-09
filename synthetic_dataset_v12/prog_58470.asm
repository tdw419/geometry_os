; DESCRIPTION: Renders a green box of size 101x59 starting at (244, 73).
; PLAN: r0=244(x), r1=73(y), r2=101(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 73
LDI r2, 101
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
