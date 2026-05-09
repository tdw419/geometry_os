; DESCRIPTION: Places a orange 82x117 rectangle at position (55, 33).
; PLAN: r0=55(x), r1=33(y), r2=82(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 33
LDI r2, 82
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
