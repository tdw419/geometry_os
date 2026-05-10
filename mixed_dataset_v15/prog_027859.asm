; DESCRIPTION: Creates a cyan filled rectangle of size 13x50 starting at (193, 34).
; PLAN: r0=193(x), r1=34(y), r2=13(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 34
LDI r2, 13
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
