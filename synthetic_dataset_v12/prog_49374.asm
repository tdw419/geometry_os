; DESCRIPTION: Places a purple 77x102 rectangle at position (161, 117).
; PLAN: r0=161(x), r1=117(y), r2=77(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 117
LDI r2, 77
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
