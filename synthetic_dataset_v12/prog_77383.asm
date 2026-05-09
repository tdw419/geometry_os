; DESCRIPTION: Places a green 14x86 rectangle at position (357, 106).
; PLAN: r0=357(x), r1=106(y), r2=14(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 106
LDI r2, 14
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
