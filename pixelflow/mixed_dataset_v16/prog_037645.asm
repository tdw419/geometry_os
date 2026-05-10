; DESCRIPTION: Creates a white filled rectangle of size 60x87 starting at (353, 133).
; PLAN: r0=353(x), r1=133(y), r2=60(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 133
LDI r2, 60
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
