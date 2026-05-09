; DESCRIPTION: Places a orange 107x101 rectangle at position (101, 144).
; PLAN: r0=101(x), r1=144(y), r2=107(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 144
LDI r2, 107
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
