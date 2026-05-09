; DESCRIPTION: Places a blue 90x87 rectangle at position (71, 90).
; PLAN: r0=71(x), r1=90(y), r2=90(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 90
LDI r2, 90
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
