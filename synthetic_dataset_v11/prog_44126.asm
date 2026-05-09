; DESCRIPTION: Places a purple 13x66 rectangle at position (68, 80).
; PLAN: r0=68(x), r1=80(y), r2=13(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 80
LDI r2, 13
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
