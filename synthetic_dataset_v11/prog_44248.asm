; DESCRIPTION: Places a yellow 119x92 rectangle at position (45, 147).
; PLAN: r0=45(x), r1=147(y), r2=119(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 147
LDI r2, 119
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
