; DESCRIPTION: Places a cyan 114x10 rectangle at position (357, 212).
; PLAN: r0=357(x), r1=212(y), r2=114(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 212
LDI r2, 114
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
