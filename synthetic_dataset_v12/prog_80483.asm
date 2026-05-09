; DESCRIPTION: Places a yellow 11x60 rectangle at position (341, 22).
; PLAN: r0=341(x), r1=22(y), r2=11(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 22
LDI r2, 11
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
