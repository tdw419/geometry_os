; DESCRIPTION: Places a green 70x84 rectangle at position (129, 33).
; PLAN: r0=129(x), r1=33(y), r2=70(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 33
LDI r2, 70
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
