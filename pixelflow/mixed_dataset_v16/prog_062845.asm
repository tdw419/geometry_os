; DESCRIPTION: Creates a white filled rectangle of size 18x23 starting at (156, 132).
; PLAN: r0=156(x), r1=132(y), r2=18(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 132
LDI r2, 18
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
