; DESCRIPTION: Places a blue 85x58 rectangle at position (169, 179).
; PLAN: r0=169(x), r1=179(y), r2=85(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 179
LDI r2, 85
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
