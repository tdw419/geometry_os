; DESCRIPTION: Creates a white filled rectangle of size 115x12 starting at (237, 40).
; PLAN: r0=237(x), r1=40(y), r2=115(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 40
LDI r2, 115
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
