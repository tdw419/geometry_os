; DESCRIPTION: Places a orange 117x70 rectangle at position (108, 161).
; PLAN: r0=108(x), r1=161(y), r2=117(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 161
LDI r2, 117
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
