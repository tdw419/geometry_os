; DESCRIPTION: Places a blue 17x102 rectangle at position (39, 106).
; PLAN: r0=39(x), r1=106(y), r2=17(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 106
LDI r2, 17
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
