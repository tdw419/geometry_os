; DESCRIPTION: Places a purple 107x64 rectangle at position (8, 186).
; PLAN: r0=8(x), r1=186(y), r2=107(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 186
LDI r2, 107
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
