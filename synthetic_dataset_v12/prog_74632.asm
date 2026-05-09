; DESCRIPTION: Places a purple 118x29 rectangle at position (236, 173).
; PLAN: r0=236(x), r1=173(y), r2=118(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 173
LDI r2, 118
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
