; DESCRIPTION: Places a yellow 119x23 rectangle at position (104, 16).
; PLAN: r0=104(x), r1=16(y), r2=119(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 16
LDI r2, 119
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
