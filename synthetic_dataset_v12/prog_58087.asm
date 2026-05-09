; DESCRIPTION: Places a purple 90x54 rectangle at position (170, 16).
; PLAN: r0=170(x), r1=16(y), r2=90(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 16
LDI r2, 90
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
