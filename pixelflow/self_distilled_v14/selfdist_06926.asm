; DESCRIPTION: Creates a white filled rectangle of size 106x37 starting at (110, 110).
; PLAN: r0=110(x), r1=110(y), r2=106(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 110
LDI r2, 106
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
