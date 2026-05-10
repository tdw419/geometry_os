; DESCRIPTION: Places a orange 46x60 rectangle at position (37, 179).
; PLAN: r0=37(x), r1=179(y), r2=46(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 179
LDI r2, 46
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
