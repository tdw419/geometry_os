; DESCRIPTION: Places a green 75x16 rectangle at position (363, 128).
; PLAN: r0=363(x), r1=128(y), r2=75(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 128
LDI r2, 75
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
