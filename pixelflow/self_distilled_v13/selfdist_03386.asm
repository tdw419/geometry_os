; DESCRIPTION: Creates a cyan filled rectangle of size 35x117 starting at (16, 116).
; PLAN: r0=16(x), r1=116(y), r2=35(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 116
LDI r2, 35
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
