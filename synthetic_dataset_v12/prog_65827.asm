; DESCRIPTION: Places a blue 51x80 rectangle at position (237, 103).
; PLAN: r0=237(x), r1=103(y), r2=51(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 103
LDI r2, 51
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
