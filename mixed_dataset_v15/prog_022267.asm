; DESCRIPTION: Creates a orange filled rectangle of size 60x85 starting at (161, 74).
; PLAN: r0=161(x), r1=74(y), r2=60(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 74
LDI r2, 60
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
