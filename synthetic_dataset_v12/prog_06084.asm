; DESCRIPTION: Places a yellow 30x20 rectangle at position (227, 181).
; PLAN: r0=227(x), r1=181(y), r2=30(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 181
LDI r2, 30
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
