; DESCRIPTION: Creates a green filled rectangle of size 81x25 starting at (308, 82).
; PLAN: r0=308(x), r1=82(y), r2=81(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 82
LDI r2, 81
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
