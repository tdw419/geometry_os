; DESCRIPTION: Renders a yellow box of size 81x58 starting at (237, 160).
; PLAN: r0=237(x), r1=160(y), r2=81(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 160
LDI r2, 81
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
