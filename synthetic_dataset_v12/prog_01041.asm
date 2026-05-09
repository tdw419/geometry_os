; DESCRIPTION: Places a yellow 14x49 rectangle at position (440, 162).
; PLAN: r0=440(x), r1=162(y), r2=14(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 162
LDI r2, 14
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
