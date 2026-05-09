; DESCRIPTION: Places a blue 33x96 rectangle at position (117, 35).
; PLAN: r0=117(x), r1=35(y), r2=33(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 35
LDI r2, 33
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
