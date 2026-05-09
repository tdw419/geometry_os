; DESCRIPTION: Places a purple 90x96 rectangle at position (18, 65).
; PLAN: r0=18(x), r1=65(y), r2=90(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 65
LDI r2, 90
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
