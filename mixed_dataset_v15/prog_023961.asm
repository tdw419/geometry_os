; DESCRIPTION: Places a blue 115x15 rectangle at position (395, 109).
; PLAN: r0=395(x), r1=109(y), r2=115(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 109
LDI r2, 115
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
