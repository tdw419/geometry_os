; DESCRIPTION: Places a purple 106x107 rectangle at position (20, 65).
; PLAN: r0=20(x), r1=65(y), r2=106(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 65
LDI r2, 106
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
