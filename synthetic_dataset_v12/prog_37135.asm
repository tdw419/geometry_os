; DESCRIPTION: Places a blue 119x92 rectangle at position (330, 126).
; PLAN: r0=330(x), r1=126(y), r2=119(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 126
LDI r2, 119
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
