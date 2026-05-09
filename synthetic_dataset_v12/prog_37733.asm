; DESCRIPTION: Places a green 87x17 rectangle at position (418, 110).
; PLAN: r0=418(x), r1=110(y), r2=87(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 110
LDI r2, 87
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
