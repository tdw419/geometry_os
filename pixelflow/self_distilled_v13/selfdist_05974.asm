; DESCRIPTION: Places a purple 62x97 box at position (275, 38).
; PLAN: r0=275(x), r1=38(y), r2=62(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 38
LDI r2, 62
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
