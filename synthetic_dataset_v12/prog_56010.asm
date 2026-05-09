; DESCRIPTION: Places a black 16x58 rectangle at position (451, 169).
; PLAN: r0=451(x), r1=169(y), r2=16(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 169
LDI r2, 16
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
