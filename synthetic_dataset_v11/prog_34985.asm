; DESCRIPTION: Places a green 100x46 rectangle at position (145, 181).
; PLAN: r0=145(x), r1=181(y), r2=100(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 181
LDI r2, 100
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
