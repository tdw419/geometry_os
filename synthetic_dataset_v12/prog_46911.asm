; DESCRIPTION: Places a blue 101x48 rectangle at position (396, 202).
; PLAN: r0=396(x), r1=202(y), r2=101(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 202
LDI r2, 101
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
