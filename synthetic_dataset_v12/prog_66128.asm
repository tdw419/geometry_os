; DESCRIPTION: Places a orange 58x106 rectangle at position (233, 14).
; PLAN: r0=233(x), r1=14(y), r2=58(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 14
LDI r2, 58
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
