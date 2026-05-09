; DESCRIPTION: Places a green 30x16 rectangle at position (31, 70).
; PLAN: r0=31(x), r1=70(y), r2=30(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 70
LDI r2, 30
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
