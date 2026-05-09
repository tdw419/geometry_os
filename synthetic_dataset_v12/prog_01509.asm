; DESCRIPTION: Places a purple 37x85 rectangle at position (287, 16).
; PLAN: r0=287(x), r1=16(y), r2=37(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 16
LDI r2, 37
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
