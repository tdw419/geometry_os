; DESCRIPTION: Places a orange 17x101 rectangle at position (323, 83).
; PLAN: r0=323(x), r1=83(y), r2=17(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 83
LDI r2, 17
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
