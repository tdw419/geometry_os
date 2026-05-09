; DESCRIPTION: Places a blue 45x26 rectangle at position (96, 109).
; PLAN: r0=96(x), r1=109(y), r2=45(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 109
LDI r2, 45
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
