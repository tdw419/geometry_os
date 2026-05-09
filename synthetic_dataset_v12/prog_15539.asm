; DESCRIPTION: Places a blue 80x109 rectangle at position (339, 7).
; PLAN: r0=339(x), r1=7(y), r2=80(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 7
LDI r2, 80
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
