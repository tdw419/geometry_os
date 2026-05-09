; DESCRIPTION: Places a green 99x35 rectangle at position (37, 46).
; PLAN: r0=37(x), r1=46(y), r2=99(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 46
LDI r2, 99
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
