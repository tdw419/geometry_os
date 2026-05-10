; DESCRIPTION: Places a green 87x52 rectangle at position (28, 23).
; PLAN: r0=28(x), r1=23(y), r2=87(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 23
LDI r2, 87
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
