; DESCRIPTION: Renders a yellow box of size 36x97 starting at (19, 76).
; PLAN: r0=19(x), r1=76(y), r2=36(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 76
LDI r2, 36
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
