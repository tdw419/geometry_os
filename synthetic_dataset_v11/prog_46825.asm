; DESCRIPTION: Places a blue 72x66 rectangle at position (51, 56).
; PLAN: r0=51(x), r1=56(y), r2=72(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 56
LDI r2, 72
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
