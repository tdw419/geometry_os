; DESCRIPTION: Creates a orange filled rectangle of size 91x92 starting at (125, 186).
; PLAN: r0=125(x), r1=186(y), r2=91(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 186
LDI r2, 91
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
