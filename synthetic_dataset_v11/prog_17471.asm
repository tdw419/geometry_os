; DESCRIPTION: Places a orange 46x87 rectangle at position (22, 82).
; PLAN: r0=22(x), r1=82(y), r2=46(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 82
LDI r2, 46
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
