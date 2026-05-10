; DESCRIPTION: Places a purple 103x76 box at position (255, 6).
; PLAN: r0=255(x), r1=6(y), r2=103(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 6
LDI r2, 103
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
