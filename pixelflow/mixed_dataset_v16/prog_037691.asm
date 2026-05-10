; DESCRIPTION: Places a blue 87x80 rectangle at position (262, 48).
; PLAN: r0=262(x), r1=48(y), r2=87(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 48
LDI r2, 87
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
