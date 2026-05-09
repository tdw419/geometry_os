; DESCRIPTION: Places a orange 117x34 rectangle at position (0, 133).
; PLAN: r0=0(x), r1=133(y), r2=117(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 133
LDI r2, 117
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
