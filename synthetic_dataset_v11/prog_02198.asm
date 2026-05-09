; DESCRIPTION: Places a purple 65x97 rectangle at position (160, 61).
; PLAN: r0=160(x), r1=61(y), r2=65(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 61
LDI r2, 65
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
