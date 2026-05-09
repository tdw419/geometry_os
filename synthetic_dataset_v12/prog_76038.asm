; DESCRIPTION: Places a orange 89x46 rectangle at position (149, 103).
; PLAN: r0=149(x), r1=103(y), r2=89(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 103
LDI r2, 89
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
