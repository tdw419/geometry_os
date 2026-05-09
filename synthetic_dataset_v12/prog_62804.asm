; DESCRIPTION: Places a orange 106x103 rectangle at position (31, 152).
; PLAN: r0=31(x), r1=152(y), r2=106(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 152
LDI r2, 106
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
