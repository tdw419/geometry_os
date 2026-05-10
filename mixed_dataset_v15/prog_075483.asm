; DESCRIPTION: Places a yellow 63x62 rectangle at position (237, 45).
; PLAN: r0=237(x), r1=45(y), r2=63(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 45
LDI r2, 63
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
