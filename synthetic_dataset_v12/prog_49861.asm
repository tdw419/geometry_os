; DESCRIPTION: Renders a yellow box of size 58x26 starting at (263, 163).
; PLAN: r0=263(x), r1=163(y), r2=58(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 163
LDI r2, 58
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
