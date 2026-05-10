; DESCRIPTION: Places a purple 79x32 rectangle at position (140, 167).
; PLAN: r0=140(x), r1=167(y), r2=79(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 167
LDI r2, 79
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
