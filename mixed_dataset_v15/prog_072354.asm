; DESCRIPTION: Renders a yellow box of size 13x83 starting at (329, 62).
; PLAN: r0=329(x), r1=62(y), r2=13(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 62
LDI r2, 13
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
