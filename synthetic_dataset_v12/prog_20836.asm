; DESCRIPTION: Places a purple 94x64 rectangle at position (206, 108).
; PLAN: r0=206(x), r1=108(y), r2=94(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 108
LDI r2, 94
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
