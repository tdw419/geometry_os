; DESCRIPTION: Creates a white filled rectangle of size 34x64 starting at (62, 95).
; PLAN: r0=62(x), r1=95(y), r2=34(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 95
LDI r2, 34
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
