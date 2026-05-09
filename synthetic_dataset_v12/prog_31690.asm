; DESCRIPTION: Places a purple 76x64 rectangle at position (302, 13).
; PLAN: r0=302(x), r1=13(y), r2=76(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 13
LDI r2, 76
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
