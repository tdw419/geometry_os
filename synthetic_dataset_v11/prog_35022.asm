; DESCRIPTION: Places a red 22x26 rectangle at position (22, 110).
; PLAN: r0=22(x), r1=110(y), r2=22(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 110
LDI r2, 22
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
