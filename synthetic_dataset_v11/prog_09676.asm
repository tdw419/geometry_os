; DESCRIPTION: Places a purple 37x96 rectangle at position (96, 143).
; PLAN: r0=96(x), r1=143(y), r2=37(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 143
LDI r2, 37
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
