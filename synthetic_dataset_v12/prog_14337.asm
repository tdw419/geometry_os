; DESCRIPTION: Places a purple 64x26 rectangle at position (301, 197).
; PLAN: r0=301(x), r1=197(y), r2=64(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 197
LDI r2, 64
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
