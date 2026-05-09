; DESCRIPTION: Places a green 13x68 rectangle at position (105, 80).
; PLAN: r0=105(x), r1=80(y), r2=13(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 80
LDI r2, 13
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
