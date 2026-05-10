; DESCRIPTION: Creates a white filled rectangle of size 114x24 starting at (23, 107).
; PLAN: r0=23(x), r1=107(y), r2=114(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 107
LDI r2, 114
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
