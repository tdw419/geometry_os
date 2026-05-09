; DESCRIPTION: Places a blue 96x96 rectangle at position (162, 1).
; PLAN: r0=162(x), r1=1(y), r2=96(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 1
LDI r2, 96
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
