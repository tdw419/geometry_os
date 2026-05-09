; DESCRIPTION: Places a green 46x110 rectangle at position (219, 76).
; PLAN: r0=219(x), r1=76(y), r2=46(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 76
LDI r2, 46
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
