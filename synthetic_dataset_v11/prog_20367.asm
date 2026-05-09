; DESCRIPTION: Places a blue 17x110 rectangle at position (228, 1).
; PLAN: r0=228(x), r1=1(y), r2=17(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 1
LDI r2, 17
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
