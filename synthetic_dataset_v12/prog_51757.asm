; DESCRIPTION: Places a green 62x117 rectangle at position (77, 13).
; PLAN: r0=77(x), r1=13(y), r2=62(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 13
LDI r2, 62
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
