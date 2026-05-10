; DESCRIPTION: Places a yellow 70x38 rectangle at position (124, 217).
; PLAN: r0=124(x), r1=217(y), r2=70(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 217
LDI r2, 70
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
