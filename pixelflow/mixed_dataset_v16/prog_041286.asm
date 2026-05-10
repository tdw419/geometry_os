; DESCRIPTION: Creates a white filled rectangle of size 98x110 starting at (366, 21).
; PLAN: r0=366(x), r1=21(y), r2=98(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 21
LDI r2, 98
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
