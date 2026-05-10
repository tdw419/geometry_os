; DESCRIPTION: Places a yellow 119x104 rectangle at position (233, 2).
; PLAN: r0=233(x), r1=2(y), r2=119(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 2
LDI r2, 119
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
