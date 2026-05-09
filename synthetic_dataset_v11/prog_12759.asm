; DESCRIPTION: Places a green 17x97 rectangle at position (115, 46).
; PLAN: r0=115(x), r1=46(y), r2=17(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 46
LDI r2, 17
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
