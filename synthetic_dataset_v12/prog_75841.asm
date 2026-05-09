; DESCRIPTION: Places a orange 109x55 rectangle at position (33, 86).
; PLAN: r0=33(x), r1=86(y), r2=109(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 86
LDI r2, 109
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
