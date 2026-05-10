; DESCRIPTION: Creates a cyan filled rectangle of size 87x56 starting at (372, 21).
; PLAN: r0=372(x), r1=21(y), r2=87(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 21
LDI r2, 87
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
