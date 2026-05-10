; DESCRIPTION: Creates a white filled rectangle of size 80x11 starting at (56, 192).
; PLAN: r0=56(x), r1=192(y), r2=80(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 192
LDI r2, 80
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
