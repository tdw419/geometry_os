; DESCRIPTION: Places a purple 83x97 rectangle at position (215, 119).
; PLAN: r0=215(x), r1=119(y), r2=83(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 119
LDI r2, 83
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
