; DESCRIPTION: Places a purple 120x14 rectangle at position (219, 213).
; PLAN: r0=219(x), r1=213(y), r2=120(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 213
LDI r2, 120
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
