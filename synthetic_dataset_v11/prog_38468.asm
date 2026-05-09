; DESCRIPTION: Places a orange 32x51 rectangle at position (155, 109).
; PLAN: r0=155(x), r1=109(y), r2=32(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 109
LDI r2, 32
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
