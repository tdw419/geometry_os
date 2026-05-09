; DESCRIPTION: Places a black 54x81 rectangle at position (55, 85).
; PLAN: r0=55(x), r1=85(y), r2=54(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 85
LDI r2, 54
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
