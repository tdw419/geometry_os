; DESCRIPTION: Renders a yellow box of size 37x17 starting at (176, 26).
; PLAN: r0=176(x), r1=26(y), r2=37(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 26
LDI r2, 37
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
