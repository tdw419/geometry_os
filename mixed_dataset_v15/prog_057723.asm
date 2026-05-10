; DESCRIPTION: Creates a white filled rectangle of size 65x94 starting at (351, 113).
; PLAN: r0=351(x), r1=113(y), r2=65(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 113
LDI r2, 65
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
