; DESCRIPTION: Creates a cyan filled rectangle of size 28x110 starting at (254, 126).
; PLAN: r0=254(x), r1=126(y), r2=28(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 126
LDI r2, 28
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
