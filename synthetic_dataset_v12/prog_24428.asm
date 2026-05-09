; DESCRIPTION: Renders a yellow box of size 103x26 starting at (383, 227).
; PLAN: r0=383(x), r1=227(y), r2=103(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 227
LDI r2, 103
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
