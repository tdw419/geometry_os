; DESCRIPTION: Places a purple 38x63 rectangle at position (364, 77).
; PLAN: r0=364(x), r1=77(y), r2=38(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 77
LDI r2, 38
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
