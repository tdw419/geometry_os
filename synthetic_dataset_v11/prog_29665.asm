; DESCRIPTION: Places a yellow 62x10 rectangle at position (92, 201).
; PLAN: r0=92(x), r1=201(y), r2=62(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 201
LDI r2, 62
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
