; DESCRIPTION: Places a purple 112x78 rectangle at position (28, 54).
; PLAN: r0=28(x), r1=54(y), r2=112(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 54
LDI r2, 112
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
