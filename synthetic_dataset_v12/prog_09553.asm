; DESCRIPTION: Places a blue 106x45 rectangle at position (288, 78).
; PLAN: r0=288(x), r1=78(y), r2=106(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 78
LDI r2, 106
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
