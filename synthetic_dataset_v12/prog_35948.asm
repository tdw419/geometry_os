; DESCRIPTION: Places a blue 75x85 rectangle at position (205, 96).
; PLAN: r0=205(x), r1=96(y), r2=75(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 96
LDI r2, 75
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
