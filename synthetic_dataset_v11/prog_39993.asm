; DESCRIPTION: Renders a yellow box of size 62x87 starting at (117, 63).
; PLAN: r0=117(x), r1=63(y), r2=62(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 63
LDI r2, 62
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
