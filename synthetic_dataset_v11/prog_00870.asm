; DESCRIPTION: Places a orange 66x63 rectangle at position (183, 132).
; PLAN: r0=183(x), r1=132(y), r2=66(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 132
LDI r2, 66
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
