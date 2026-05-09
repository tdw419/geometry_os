; DESCRIPTION: Places a orange 56x81 rectangle at position (190, 147).
; PLAN: r0=190(x), r1=147(y), r2=56(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 147
LDI r2, 56
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
