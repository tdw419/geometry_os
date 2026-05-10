; DESCRIPTION: Renders a yellow box of size 18x61 starting at (258, 40).
; PLAN: r0=258(x), r1=40(y), r2=18(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 40
LDI r2, 18
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
