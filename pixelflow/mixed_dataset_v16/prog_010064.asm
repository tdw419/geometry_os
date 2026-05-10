; DESCRIPTION: Creates a cyan filled rectangle of size 16x85 starting at (72, 5).
; PLAN: r0=72(x), r1=5(y), r2=16(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 5
LDI r2, 16
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
