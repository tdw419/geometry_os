; DESCRIPTION: Places a blue 90x21 rectangle at position (139, 95).
; PLAN: r0=139(x), r1=95(y), r2=90(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 95
LDI r2, 90
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
