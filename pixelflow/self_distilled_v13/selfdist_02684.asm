; DESCRIPTION: Creates a white filled rectangle of size 59x23 starting at (116, 3).
; PLAN: r0=116(x), r1=3(y), r2=59(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 3
LDI r2, 59
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
