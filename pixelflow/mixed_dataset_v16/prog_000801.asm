; DESCRIPTION: Places a blue 48x84 rectangle at position (80, 155).
; PLAN: r0=80(x), r1=155(y), r2=48(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 155
LDI r2, 48
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
