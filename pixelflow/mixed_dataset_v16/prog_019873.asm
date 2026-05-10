; DESCRIPTION: Places a blue 85x68 rectangle at position (185, 82).
; PLAN: r0=185(x), r1=82(y), r2=85(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 82
LDI r2, 85
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
