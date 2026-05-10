; DESCRIPTION: Creates a white filled rectangle of size 110x72 starting at (217, 167).
; PLAN: r0=217(x), r1=167(y), r2=110(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 167
LDI r2, 110
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
