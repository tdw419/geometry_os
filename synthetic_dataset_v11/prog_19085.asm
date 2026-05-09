; DESCRIPTION: Places a green 71x87 rectangle at position (56, 86).
; PLAN: r0=56(x), r1=86(y), r2=71(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 86
LDI r2, 71
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
