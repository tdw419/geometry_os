; DESCRIPTION: Places a blue 106x22 rectangle at position (54, 139).
; PLAN: r0=54(x), r1=139(y), r2=106(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 139
LDI r2, 106
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
