; DESCRIPTION: Places a purple 45x54 rectangle at position (301, 56).
; PLAN: r0=301(x), r1=56(y), r2=45(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 56
LDI r2, 45
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
