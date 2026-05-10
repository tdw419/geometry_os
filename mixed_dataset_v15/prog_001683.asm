; DESCRIPTION: Creates a orange filled rectangle of size 87x48 starting at (28, 8).
; PLAN: r0=28(x), r1=8(y), r2=87(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 8
LDI r2, 87
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
