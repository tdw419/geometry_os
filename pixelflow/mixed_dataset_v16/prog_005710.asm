; DESCRIPTION: Places a purple 62x38 box at position (249, 96).
; PLAN: r0=249(x), r1=96(y), r2=62(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 96
LDI r2, 62
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
