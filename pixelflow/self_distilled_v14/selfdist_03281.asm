; DESCRIPTION: Creates a orange filled rectangle of size 85x83 starting at (169, 187).
; PLAN: r0=169(x), r1=187(y), r2=85(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 187
LDI r2, 85
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
