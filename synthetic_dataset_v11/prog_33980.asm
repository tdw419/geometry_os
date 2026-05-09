; DESCRIPTION: Places a yellow 47x98 rectangle at position (100, 110).
; PLAN: r0=100(x), r1=110(y), r2=47(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 110
LDI r2, 47
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
