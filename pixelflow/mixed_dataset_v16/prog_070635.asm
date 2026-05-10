; DESCRIPTION: Places a green 36x108 rectangle at position (192, 123).
; PLAN: r0=192(x), r1=123(y), r2=36(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 123
LDI r2, 36
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
