; DESCRIPTION: Creates a purple filled rectangle of size 71x110 starting at (173, 16).
; PLAN: r0=173(x), r1=16(y), r2=71(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 16
LDI r2, 71
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
