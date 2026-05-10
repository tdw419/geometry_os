; DESCRIPTION: Creates a blue filled rectangle of size 117x120 starting at (103, 145).
; PLAN: r0=103(x), r1=145(y), r2=117(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 145
LDI r2, 117
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
