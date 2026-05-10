; DESCRIPTION: Creates a yellow rectangular region at (345, 207) spanning 94 by 22 pixels.
; PLAN: r0=345(x), r1=207(y), r2=94(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 207
LDI r2, 94
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
