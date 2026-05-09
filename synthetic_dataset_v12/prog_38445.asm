; DESCRIPTION: Places a yellow 77x110 rectangle at position (255, 139).
; PLAN: r0=255(x), r1=139(y), r2=77(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 139
LDI r2, 77
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
