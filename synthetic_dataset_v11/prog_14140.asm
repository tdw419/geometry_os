; DESCRIPTION: Places a blue 85x22 rectangle at position (15, 152).
; PLAN: r0=15(x), r1=152(y), r2=85(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 152
LDI r2, 85
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
