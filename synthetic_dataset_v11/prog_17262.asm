; DESCRIPTION: Renders a yellow box of size 62x86 starting at (84, 54).
; PLAN: r0=84(x), r1=54(y), r2=62(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 54
LDI r2, 62
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
