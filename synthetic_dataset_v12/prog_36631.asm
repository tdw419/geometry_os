; DESCRIPTION: Places a purple 71x63 rectangle at position (250, 123).
; PLAN: r0=250(x), r1=123(y), r2=71(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 123
LDI r2, 71
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
