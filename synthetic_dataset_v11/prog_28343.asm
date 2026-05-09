; DESCRIPTION: Places a blue 95x25 rectangle at position (0, 152).
; PLAN: r0=0(x), r1=152(y), r2=95(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 152
LDI r2, 95
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
