; DESCRIPTION: Renders a green box of size 53x107 starting at (141, 59).
; PLAN: r0=141(x), r1=59(y), r2=53(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 59
LDI r2, 53
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
