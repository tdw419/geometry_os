; DESCRIPTION: Renders a yellow box of size 12x55 starting at (13, 128).
; PLAN: r0=13(x), r1=128(y), r2=12(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 128
LDI r2, 12
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
