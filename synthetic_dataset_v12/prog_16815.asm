; DESCRIPTION: Places a yellow 45x103 rectangle at position (44, 22).
; PLAN: r0=44(x), r1=22(y), r2=45(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 22
LDI r2, 45
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
