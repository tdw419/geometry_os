; DESCRIPTION: Places a purple 86x120 rectangle at position (240, 2).
; PLAN: r0=240(x), r1=2(y), r2=86(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 2
LDI r2, 86
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
