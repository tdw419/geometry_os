; DESCRIPTION: Places a purple 33x98 rectangle at position (364, 14).
; PLAN: r0=364(x), r1=14(y), r2=33(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 14
LDI r2, 33
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
