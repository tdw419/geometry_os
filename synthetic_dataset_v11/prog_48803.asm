; DESCRIPTION: Places a green 71x84 rectangle at position (148, 158).
; PLAN: r0=148(x), r1=158(y), r2=71(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 158
LDI r2, 71
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
