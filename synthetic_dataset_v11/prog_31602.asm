; DESCRIPTION: Places a purple 24x99 rectangle at position (198, 30).
; PLAN: r0=198(x), r1=30(y), r2=24(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 30
LDI r2, 24
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
