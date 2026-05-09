; DESCRIPTION: Places a blue 96x24 rectangle at position (225, 231).
; PLAN: r0=225(x), r1=231(y), r2=96(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 231
LDI r2, 96
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
