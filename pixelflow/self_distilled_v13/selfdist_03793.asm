; DESCRIPTION: Creates a orange filled rectangle of size 56x87 starting at (148, 107).
; PLAN: r0=148(x), r1=107(y), r2=56(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 107
LDI r2, 56
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
