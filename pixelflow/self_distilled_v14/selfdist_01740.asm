; DESCRIPTION: Creates a orange filled rectangle of size 13x46 starting at (387, 76).
; PLAN: r0=387(x), r1=76(y), r2=13(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 76
LDI r2, 13
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
