; DESCRIPTION: Places a orange 59x112 rectangle at position (22, 49).
; PLAN: r0=22(x), r1=49(y), r2=59(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 49
LDI r2, 59
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
