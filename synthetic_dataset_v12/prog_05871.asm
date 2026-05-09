; DESCRIPTION: Places a blue 46x43 rectangle at position (419, 80).
; PLAN: r0=419(x), r1=80(y), r2=46(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 80
LDI r2, 46
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
