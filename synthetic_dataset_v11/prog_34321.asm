; DESCRIPTION: Places a purple 38x80 rectangle at position (215, 81).
; PLAN: r0=215(x), r1=81(y), r2=38(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 81
LDI r2, 38
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
