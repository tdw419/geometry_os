; DESCRIPTION: Places a red 99x17 rectangle at position (23, 162).
; PLAN: r0=23(x), r1=162(y), r2=99(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 162
LDI r2, 99
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
