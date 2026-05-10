; DESCRIPTION: Places a yellow 99x63 rectangle at position (22, 168).
; PLAN: r0=22(x), r1=168(y), r2=99(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 168
LDI r2, 99
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
