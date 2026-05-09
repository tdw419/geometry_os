; DESCRIPTION: Places a purple 35x10 rectangle at position (444, 181).
; PLAN: r0=444(x), r1=181(y), r2=35(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 181
LDI r2, 35
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
