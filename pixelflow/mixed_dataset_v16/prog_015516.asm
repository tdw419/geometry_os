; DESCRIPTION: Places a blue 75x68 rectangle at position (169, 36).
; PLAN: r0=169(x), r1=36(y), r2=75(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 36
LDI r2, 75
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
