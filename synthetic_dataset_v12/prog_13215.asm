; DESCRIPTION: Renders a yellow box of size 42x58 starting at (218, 35).
; PLAN: r0=218(x), r1=35(y), r2=42(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 35
LDI r2, 42
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
