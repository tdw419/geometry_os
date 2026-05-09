; DESCRIPTION: Places a green 21x15 rectangle at position (357, 70).
; PLAN: r0=357(x), r1=70(y), r2=21(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 70
LDI r2, 21
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
