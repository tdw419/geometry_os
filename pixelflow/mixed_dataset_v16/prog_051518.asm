; DESCRIPTION: Creates a purple filled rectangle of size 76x10 starting at (206, 50).
; PLAN: r0=206(x), r1=50(y), r2=76(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 50
LDI r2, 76
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
