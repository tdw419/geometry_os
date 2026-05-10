; DESCRIPTION: Places a purple 113x78 rectangle at position (120, 13).
; PLAN: r0=120(x), r1=13(y), r2=113(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 13
LDI r2, 113
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
