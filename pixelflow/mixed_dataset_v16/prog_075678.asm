; DESCRIPTION: Places a green 35x14 rectangle at position (162, 225).
; PLAN: r0=162(x), r1=225(y), r2=35(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 225
LDI r2, 35
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
