; DESCRIPTION: Creates a orange filled rectangle of size 54x65 starting at (389, 119).
; PLAN: r0=389(x), r1=119(y), r2=54(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 119
LDI r2, 54
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
