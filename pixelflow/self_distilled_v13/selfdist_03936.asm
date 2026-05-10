; DESCRIPTION: Creates a cyan filled rectangle of size 48x118 starting at (36, 65).
; PLAN: r0=36(x), r1=65(y), r2=48(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 65
LDI r2, 48
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
