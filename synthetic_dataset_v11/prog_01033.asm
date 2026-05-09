; DESCRIPTION: Places a blue 59x103 rectangle at position (47, 51).
; PLAN: r0=47(x), r1=51(y), r2=59(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 51
LDI r2, 59
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
