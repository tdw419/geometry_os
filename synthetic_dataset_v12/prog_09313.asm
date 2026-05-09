; DESCRIPTION: Places a orange 31x72 rectangle at position (378, 101).
; PLAN: r0=378(x), r1=101(y), r2=31(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 101
LDI r2, 31
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
