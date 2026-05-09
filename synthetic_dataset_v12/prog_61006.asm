; DESCRIPTION: Places a yellow 29x31 rectangle at position (477, 123).
; PLAN: r0=477(x), r1=123(y), r2=29(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 123
LDI r2, 29
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
