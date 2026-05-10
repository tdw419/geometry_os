; DESCRIPTION: Places a purple 85x59 box at position (244, 46).
; PLAN: r0=244(x), r1=46(y), r2=85(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 46
LDI r2, 85
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
