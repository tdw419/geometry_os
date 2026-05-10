; DESCRIPTION: Creates a green filled rectangle of size 57x99 starting at (196, 89).
; PLAN: r0=196(x), r1=89(y), r2=57(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 89
LDI r2, 57
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
