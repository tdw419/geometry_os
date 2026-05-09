; DESCRIPTION: Places a yellow 99x81 rectangle at position (16, 78).
; PLAN: r0=16(x), r1=78(y), r2=99(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 78
LDI r2, 99
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
