; DESCRIPTION: Places a purple 97x25 rectangle at position (59, 89).
; PLAN: r0=59(x), r1=89(y), r2=97(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 89
LDI r2, 97
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
