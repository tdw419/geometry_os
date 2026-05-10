; DESCRIPTION: Places a purple 59x94 box at position (46, 59).
; PLAN: r0=46(x), r1=59(y), r2=59(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 59
LDI r2, 59
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
