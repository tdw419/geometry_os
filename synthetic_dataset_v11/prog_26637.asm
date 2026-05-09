; DESCRIPTION: Places a purple 70x77 rectangle at position (123, 140).
; PLAN: r0=123(x), r1=140(y), r2=70(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 140
LDI r2, 70
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
