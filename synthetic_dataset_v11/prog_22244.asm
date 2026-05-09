; DESCRIPTION: Places a blue 20x102 rectangle at position (55, 52).
; PLAN: r0=55(x), r1=52(y), r2=20(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 52
LDI r2, 20
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
