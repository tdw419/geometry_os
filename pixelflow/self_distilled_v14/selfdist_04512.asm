; DESCRIPTION: Creates a white filled rectangle of size 94x24 starting at (366, 44).
; PLAN: r0=366(x), r1=44(y), r2=94(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 44
LDI r2, 94
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
