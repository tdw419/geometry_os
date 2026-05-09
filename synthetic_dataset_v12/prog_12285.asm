; DESCRIPTION: Places a orange 49x100 rectangle at position (435, 79).
; PLAN: r0=435(x), r1=79(y), r2=49(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 79
LDI r2, 49
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
