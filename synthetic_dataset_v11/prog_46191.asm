; DESCRIPTION: Places a purple 91x93 rectangle at position (14, 54).
; PLAN: r0=14(x), r1=54(y), r2=91(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 54
LDI r2, 91
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
