; DESCRIPTION: Places a orange 83x74 rectangle at position (156, 56).
; PLAN: r0=156(x), r1=56(y), r2=83(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 56
LDI r2, 83
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
