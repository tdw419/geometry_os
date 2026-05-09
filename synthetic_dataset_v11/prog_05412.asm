; DESCRIPTION: Places a red 99x66 rectangle at position (105, 100).
; PLAN: r0=105(x), r1=100(y), r2=99(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 100
LDI r2, 99
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
