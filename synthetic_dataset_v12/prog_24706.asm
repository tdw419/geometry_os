; DESCRIPTION: Places a blue 119x111 rectangle at position (11, 6).
; PLAN: r0=11(x), r1=6(y), r2=119(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 6
LDI r2, 119
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
