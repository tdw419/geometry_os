; DESCRIPTION: Places a blue 99x83 rectangle at position (145, 46).
; PLAN: r0=145(x), r1=46(y), r2=99(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 46
LDI r2, 99
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
