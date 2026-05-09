; DESCRIPTION: Places a orange 40x31 rectangle at position (141, 103).
; PLAN: r0=141(x), r1=103(y), r2=40(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 103
LDI r2, 40
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
