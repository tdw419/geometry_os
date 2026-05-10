; DESCRIPTION: Creates a green filled rectangle of size 57x86 starting at (176, 1).
; PLAN: r0=176(x), r1=1(y), r2=57(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 1
LDI r2, 57
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
