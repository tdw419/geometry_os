; DESCRIPTION: Places a green 21x80 rectangle at position (54, 58).
; PLAN: r0=54(x), r1=58(y), r2=21(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 58
LDI r2, 21
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
