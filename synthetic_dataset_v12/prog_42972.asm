; DESCRIPTION: Places a yellow 87x102 rectangle at position (97, 86).
; PLAN: r0=97(x), r1=86(y), r2=87(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 86
LDI r2, 87
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
