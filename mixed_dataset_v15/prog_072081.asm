; DESCRIPTION: Creates a orange filled rectangle of size 91x51 starting at (134, 182).
; PLAN: r0=134(x), r1=182(y), r2=91(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 182
LDI r2, 91
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
