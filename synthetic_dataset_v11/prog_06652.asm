; DESCRIPTION: Places a yellow 22x75 rectangle at position (192, 72).
; PLAN: r0=192(x), r1=72(y), r2=22(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 72
LDI r2, 22
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
