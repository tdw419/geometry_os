; DESCRIPTION: Places a red 104x19 rectangle at position (76, 216).
; PLAN: r0=76(x), r1=216(y), r2=104(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 216
LDI r2, 104
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
