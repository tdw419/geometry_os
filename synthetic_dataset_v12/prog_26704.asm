; DESCRIPTION: Renders a yellow box of size 65x58 starting at (408, 64).
; PLAN: r0=408(x), r1=64(y), r2=65(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 64
LDI r2, 65
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
