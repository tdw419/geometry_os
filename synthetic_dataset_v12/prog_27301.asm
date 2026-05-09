; DESCRIPTION: Renders a yellow box of size 106x26 starting at (32, 191).
; PLAN: r0=32(x), r1=191(y), r2=106(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 191
LDI r2, 106
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
