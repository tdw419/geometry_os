; DESCRIPTION: Creates a green filled rectangle of size 96x34 starting at (365, 124).
; PLAN: r0=365(x), r1=124(y), r2=96(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 124
LDI r2, 96
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
