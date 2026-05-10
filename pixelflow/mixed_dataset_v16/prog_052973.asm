; DESCRIPTION: Creates a orange filled rectangle of size 25x107 starting at (45, 128).
; PLAN: r0=45(x), r1=128(y), r2=25(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 128
LDI r2, 25
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
