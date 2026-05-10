; DESCRIPTION: Creates a orange filled rectangle of size 89x103 starting at (243, 121).
; PLAN: r0=243(x), r1=121(y), r2=89(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 121
LDI r2, 89
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
