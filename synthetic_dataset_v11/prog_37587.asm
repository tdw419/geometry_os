; DESCRIPTION: Places a blue 40x106 rectangle at position (33, 89).
; PLAN: r0=33(x), r1=89(y), r2=40(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 89
LDI r2, 40
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
