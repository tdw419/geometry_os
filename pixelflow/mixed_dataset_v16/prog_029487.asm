; DESCRIPTION: Creates a green filled rectangle of size 86x58 starting at (125, 192).
; PLAN: r0=125(x), r1=192(y), r2=86(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 192
LDI r2, 86
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
