; DESCRIPTION: Creates a white filled rectangle of size 50x94 starting at (5, 200).
; PLAN: r0=5(x), r1=200(y), r2=50(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 200
LDI r2, 50
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
