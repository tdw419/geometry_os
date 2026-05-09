; DESCRIPTION: Places a blue 16x79 rectangle at position (262, 140).
; PLAN: r0=262(x), r1=140(y), r2=16(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 140
LDI r2, 16
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
