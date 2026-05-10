; DESCRIPTION: Creates a white filled rectangle of size 44x116 starting at (325, 52).
; PLAN: r0=325(x), r1=52(y), r2=44(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 52
LDI r2, 44
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
