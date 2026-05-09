; DESCRIPTION: Places a blue 68x16 rectangle at position (5, 118).
; PLAN: r0=5(x), r1=118(y), r2=68(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 118
LDI r2, 68
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
