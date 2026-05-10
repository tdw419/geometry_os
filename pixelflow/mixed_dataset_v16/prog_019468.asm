; DESCRIPTION: Creates a orange filled rectangle of size 118x105 starting at (46, 170).
; PLAN: r0=46(x), r1=170(y), r2=118(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 170
LDI r2, 118
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
