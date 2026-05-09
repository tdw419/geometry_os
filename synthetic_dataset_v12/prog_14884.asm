; DESCRIPTION: Places a purple 65x99 rectangle at position (331, 34).
; PLAN: r0=331(x), r1=34(y), r2=65(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 34
LDI r2, 65
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
