; DESCRIPTION: Places a blue 33x51 rectangle at position (129, 48).
; PLAN: r0=129(x), r1=48(y), r2=33(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 48
LDI r2, 33
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
