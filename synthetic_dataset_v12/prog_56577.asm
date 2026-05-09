; DESCRIPTION: Places a orange 55x31 rectangle at position (9, 208).
; PLAN: r0=9(x), r1=208(y), r2=55(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 208
LDI r2, 55
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
