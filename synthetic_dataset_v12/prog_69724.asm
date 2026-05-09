; DESCRIPTION: Places a blue 68x87 rectangle at position (210, 122).
; PLAN: r0=210(x), r1=122(y), r2=68(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 122
LDI r2, 68
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
