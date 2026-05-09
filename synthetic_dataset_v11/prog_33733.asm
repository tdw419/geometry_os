; DESCRIPTION: Places a blue 62x80 rectangle at position (104, 46).
; PLAN: r0=104(x), r1=46(y), r2=62(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 46
LDI r2, 62
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
