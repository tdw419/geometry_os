; DESCRIPTION: Places a blue 23x108 rectangle at position (152, 89).
; PLAN: r0=152(x), r1=89(y), r2=23(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 89
LDI r2, 23
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
