; DESCRIPTION: Creates a white filled rectangle of size 81x73 starting at (28, 73).
; PLAN: r0=28(x), r1=73(y), r2=81(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 73
LDI r2, 81
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
