; DESCRIPTION: Creates a orange filled rectangle of size 117x115 starting at (241, 79).
; PLAN: r0=241(x), r1=79(y), r2=117(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 79
LDI r2, 117
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
