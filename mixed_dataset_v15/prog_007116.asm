; DESCRIPTION: Creates a white filled rectangle of size 14x95 starting at (345, 200).
; PLAN: r0=345(x), r1=200(y), r2=14(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 200
LDI r2, 14
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
