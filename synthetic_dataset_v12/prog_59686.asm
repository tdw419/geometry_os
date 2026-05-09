; DESCRIPTION: Places a green 32x83 rectangle at position (17, 63).
; PLAN: r0=17(x), r1=63(y), r2=32(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 63
LDI r2, 32
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
