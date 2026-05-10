; DESCRIPTION: Creates a white filled rectangle of size 82x86 starting at (97, 20).
; PLAN: r0=97(x), r1=20(y), r2=82(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 20
LDI r2, 82
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
