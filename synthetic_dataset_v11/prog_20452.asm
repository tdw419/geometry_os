; DESCRIPTION: Places a blue 34x79 rectangle at position (32, 102).
; PLAN: r0=32(x), r1=102(y), r2=34(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 102
LDI r2, 34
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
