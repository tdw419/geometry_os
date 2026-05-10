; DESCRIPTION: Places a yellow 58x16 rectangle at position (216, 90).
; PLAN: r0=216(x), r1=90(y), r2=58(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 90
LDI r2, 58
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
