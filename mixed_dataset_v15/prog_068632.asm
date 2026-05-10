; DESCRIPTION: Creates a orange filled rectangle of size 118x64 starting at (280, 106).
; PLAN: r0=280(x), r1=106(y), r2=118(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 106
LDI r2, 118
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
