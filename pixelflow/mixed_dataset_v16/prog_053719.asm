; DESCRIPTION: Creates a orange filled rectangle of size 20x97 starting at (166, 134).
; PLAN: r0=166(x), r1=134(y), r2=20(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 134
LDI r2, 20
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
