; DESCRIPTION: Creates a purple filled rectangle of size 50x27 starting at (254, 37).
; PLAN: r0=254(x), r1=37(y), r2=50(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 37
LDI r2, 50
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
