; DESCRIPTION: Places a purple 120x29 rectangle at position (34, 160).
; PLAN: r0=34(x), r1=160(y), r2=120(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 160
LDI r2, 120
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
