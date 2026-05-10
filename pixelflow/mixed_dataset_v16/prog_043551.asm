; DESCRIPTION: Places a yellow 94x66 rectangle at position (363, 97).
; PLAN: r0=363(x), r1=97(y), r2=94(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 97
LDI r2, 94
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
