; DESCRIPTION: Places a blue 35x61 rectangle at position (22, 38).
; PLAN: r0=22(x), r1=38(y), r2=35(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 38
LDI r2, 35
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
