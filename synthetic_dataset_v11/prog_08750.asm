; DESCRIPTION: Places a green 97x22 rectangle at position (68, 32).
; PLAN: r0=68(x), r1=32(y), r2=97(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 32
LDI r2, 97
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
