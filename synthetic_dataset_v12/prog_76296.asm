; DESCRIPTION: Places a green 21x88 rectangle at position (162, 44).
; PLAN: r0=162(x), r1=44(y), r2=21(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 44
LDI r2, 21
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
