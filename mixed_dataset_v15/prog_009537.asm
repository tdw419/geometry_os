; DESCRIPTION: Places a green 25x73 rectangle at position (162, 56).
; PLAN: r0=162(x), r1=56(y), r2=25(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 56
LDI r2, 25
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
