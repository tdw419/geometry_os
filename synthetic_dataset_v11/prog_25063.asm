; DESCRIPTION: Places a yellow 20x38 rectangle at position (9, 35).
; PLAN: r0=9(x), r1=35(y), r2=20(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 35
LDI r2, 20
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
