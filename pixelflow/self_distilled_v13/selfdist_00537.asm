; DESCRIPTION: Creates a white filled rectangle of size 30x73 starting at (74, 126).
; PLAN: r0=74(x), r1=126(y), r2=30(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 126
LDI r2, 30
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
