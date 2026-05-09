; DESCRIPTION: Places a blue 23x51 rectangle at position (135, 20).
; PLAN: r0=135(x), r1=20(y), r2=23(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 20
LDI r2, 23
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
