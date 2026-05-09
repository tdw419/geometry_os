; DESCRIPTION: Places a black 87x62 rectangle at position (169, 156).
; PLAN: r0=169(x), r1=156(y), r2=87(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 156
LDI r2, 87
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
