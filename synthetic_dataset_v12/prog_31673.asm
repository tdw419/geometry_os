; DESCRIPTION: Renders a yellow box of size 29x13 starting at (261, 206).
; PLAN: r0=261(x), r1=206(y), r2=29(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 206
LDI r2, 29
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
