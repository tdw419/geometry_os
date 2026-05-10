; DESCRIPTION: Places a green 87x13 rectangle at position (347, 102).
; PLAN: r0=347(x), r1=102(y), r2=87(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 102
LDI r2, 87
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
