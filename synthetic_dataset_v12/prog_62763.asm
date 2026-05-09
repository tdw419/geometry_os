; DESCRIPTION: Places a red 91x52 rectangle at position (99, 123).
; PLAN: r0=99(x), r1=123(y), r2=91(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 123
LDI r2, 91
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
