; DESCRIPTION: Places a blue 54x99 rectangle at position (76, 46).
; PLAN: r0=76(x), r1=46(y), r2=54(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 46
LDI r2, 54
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
