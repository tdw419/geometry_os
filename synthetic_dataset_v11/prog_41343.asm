; DESCRIPTION: Renders a yellow box of size 97x36 starting at (38, 144).
; PLAN: r0=38(x), r1=144(y), r2=97(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 144
LDI r2, 97
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
