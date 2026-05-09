; DESCRIPTION: Places a green 12x81 rectangle at position (272, 12).
; PLAN: r0=272(x), r1=12(y), r2=12(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 12
LDI r2, 12
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
