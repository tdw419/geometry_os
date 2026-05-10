; DESCRIPTION: Places a orange 101x66 rectangle at position (87, 165).
; PLAN: r0=87(x), r1=165(y), r2=101(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 165
LDI r2, 101
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
