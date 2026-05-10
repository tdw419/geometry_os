; DESCRIPTION: Creates a blue filled rectangle of size 79x83 starting at (206, 14).
; PLAN: r0=206(x), r1=14(y), r2=79(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 14
LDI r2, 79
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
