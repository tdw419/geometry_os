; DESCRIPTION: Places a blue 90x10 rectangle at position (225, 149).
; PLAN: r0=225(x), r1=149(y), r2=90(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 149
LDI r2, 90
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
