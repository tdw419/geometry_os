; DESCRIPTION: Places a yellow 76x104 rectangle at position (118, 80).
; PLAN: r0=118(x), r1=80(y), r2=76(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 80
LDI r2, 76
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
