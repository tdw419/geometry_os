; DESCRIPTION: Places a purple 16x58 rectangle at position (302, 75).
; PLAN: r0=302(x), r1=75(y), r2=16(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 75
LDI r2, 16
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
