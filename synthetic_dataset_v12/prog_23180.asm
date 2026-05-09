; DESCRIPTION: Places a purple 47x16 rectangle at position (148, 202).
; PLAN: r0=148(x), r1=202(y), r2=47(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 202
LDI r2, 47
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
