; DESCRIPTION: Places a purple 59x33 rectangle at position (49, 77).
; PLAN: r0=49(x), r1=77(y), r2=59(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 77
LDI r2, 59
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
