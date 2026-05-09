; DESCRIPTION: Places a purple 83x23 rectangle at position (68, 74).
; PLAN: r0=68(x), r1=74(y), r2=83(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 74
LDI r2, 83
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
