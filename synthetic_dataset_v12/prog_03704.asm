; DESCRIPTION: Places a green 59x110 rectangle at position (190, 3).
; PLAN: r0=190(x), r1=3(y), r2=59(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 3
LDI r2, 59
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
