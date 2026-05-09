; DESCRIPTION: Places a yellow 43x13 rectangle at position (188, 216).
; PLAN: r0=188(x), r1=216(y), r2=43(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 216
LDI r2, 43
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
