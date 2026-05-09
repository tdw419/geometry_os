; DESCRIPTION: Places a blue 81x79 rectangle at position (262, 48).
; PLAN: r0=262(x), r1=48(y), r2=81(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 48
LDI r2, 81
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
