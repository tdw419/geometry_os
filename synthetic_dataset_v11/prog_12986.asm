; DESCRIPTION: Places a purple 64x51 rectangle at position (48, 82).
; PLAN: r0=48(x), r1=82(y), r2=64(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 82
LDI r2, 64
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
