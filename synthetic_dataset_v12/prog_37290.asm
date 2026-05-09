; DESCRIPTION: Places a magenta 80x37 rectangle at position (288, 155).
; PLAN: r0=288(x), r1=155(y), r2=80(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 155
LDI r2, 80
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
