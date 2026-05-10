; DESCRIPTION: Creates a cyan filled rectangle of size 31x84 starting at (201, 86).
; PLAN: r0=201(x), r1=86(y), r2=31(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 86
LDI r2, 31
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
