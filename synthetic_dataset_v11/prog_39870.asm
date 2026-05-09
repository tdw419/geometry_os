; DESCRIPTION: Places a yellow 81x92 rectangle at position (3, 85).
; PLAN: r0=3(x), r1=85(y), r2=81(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 85
LDI r2, 81
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
