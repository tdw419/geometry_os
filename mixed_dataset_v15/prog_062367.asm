; DESCRIPTION: Places a green 63x52 rectangle at position (283, 90).
; PLAN: r0=283(x), r1=90(y), r2=63(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 90
LDI r2, 63
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
