; DESCRIPTION: Places a purple 109x64 rectangle at position (198, 13).
; PLAN: r0=198(x), r1=13(y), r2=109(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 13
LDI r2, 109
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
