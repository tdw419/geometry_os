; DESCRIPTION: Places a green 23x80 rectangle at position (33, 16).
; PLAN: r0=33(x), r1=16(y), r2=23(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 16
LDI r2, 23
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
