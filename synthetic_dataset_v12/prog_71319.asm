; DESCRIPTION: Places a blue 40x104 rectangle at position (12, 118).
; PLAN: r0=12(x), r1=118(y), r2=40(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 118
LDI r2, 40
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
