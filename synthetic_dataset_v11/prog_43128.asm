; DESCRIPTION: Places a yellow 81x102 rectangle at position (45, 105).
; PLAN: r0=45(x), r1=105(y), r2=81(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 105
LDI r2, 81
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
