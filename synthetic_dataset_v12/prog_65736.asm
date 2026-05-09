; DESCRIPTION: Places a green 91x31 rectangle at position (337, 148).
; PLAN: r0=337(x), r1=148(y), r2=91(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 148
LDI r2, 91
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
