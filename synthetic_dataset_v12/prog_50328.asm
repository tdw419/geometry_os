; DESCRIPTION: Places a orange 54x23 rectangle at position (141, 54).
; PLAN: r0=141(x), r1=54(y), r2=54(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 54
LDI r2, 54
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
