; DESCRIPTION: Creates a green filled rectangle of size 54x66 starting at (27, 65).
; PLAN: r0=27(x), r1=65(y), r2=54(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 65
LDI r2, 54
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
